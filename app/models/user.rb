class User < ActiveRecord::Base

  scope :admins, -> { includes(:roles).where("roles.name='admin'").references(:roles) }
  scope :clients, -> { includes(:roles).where("roles.name='client' and type='car_wash_owner'").references(:roles) }
  scope :guests, -> { includes(:roles).where("roles.name='guest' and type='car_wash_owner'").references(:roles) }
  scope :users, -> { where("type = 'user'") }

  self.inheritance_column = 'subclass_of'
  has_and_belongs_to_many :roles, join_table: "roles_users"
  belongs_to :car_wash
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"
  has_many :posts

  validates_presence_of :phone, :car_wash_title, :address, if: :car_wash_owner?


  before_create do |user|
    if User.admins.empty?
      user.make_admin
    else
      user.make_guest
    end
  end

  # before_create do |user|
  #   if defined? car_wash_owner_checkbox
  #     if car_wash_owner_checkbox
  #       user.type = 'car_wash_owner'
  #     end
  #   else
  #     user.type = 'user'
  #   end
  # end

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def role?(role)
    return !!self.roles.find_by(name: role.to_s)
  end

  def self.admins
     includes(:roles).where("roles.name = 'admin'").references(:roles)
  end

  def make_admin
    self.roles << Role.admin
  end
  
  def revoke_admin
    self.roles.delete(Role.admin)
  end

  def admin?
    role?(:admin)
  end

  def client?
    role?(:client)
  end

  def guest?
    role?(:guest)
  end

  def make_guest
    self.roles << Role.guest
  end

  def revoke_guest
    self.roles.delete(Role.guest)
  end

  def make_client
    self.roles << Role.client
  end

  def revoke_client
    self.roles.delete(Role.client)
  end

  def forem_admin?
    admin?
  end

  def forem_name
    if admin?
      'Администратор'
    else
      car_wash_title
    end
  end

  def car_wash_owner?
    # byebug
    type == 'car_wash_owner'
  end

  # def type
    # 
  # end

  def can_create_forem_topics?(forum)
    true
  end


  def self.find_for_facebook_oauth access_token
     User.where(:social_id => access_token.uid).first
  end

  def self.find_for_vk_oauth access_token
     User.where(:social_id => access_token.uid).first
  end
  # def self.find_for_authentication(conditions)
  #   email = conditions[:email]
  #   user = User.where(email: email)
  #   normal_user = NormalUser.where(email: email)
  #   if user.count > 0
  #     res = user.first
  #   elsif normal_user.count > 0
  #     res = normal_user.first
  #   else
  #     res = user.first
  #   end
  #   # byebug
  #   res
  # end
end
