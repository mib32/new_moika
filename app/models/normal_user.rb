class NormalUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :subscribes
  has_many :car_washes, through: :subscribes

  has_many :sent_messages, class_name: "NormalUserMessage", foreign_key: "sender_id"
  has_many :received_messages, class_name: "NormalUserMessage", foreign_key: "receiver_id"

  # unless method_defined?(:can_read_forem_category?)
  #   def can_read_forem_category?(category)
  #     true
  #   end
  # end

  # unless method_defined?(:can_read_forem_forums?)
  #   def can_read_forem_forums?
  #     true
  #   end
  # end

  # unless method_defined?(:can_read_forem_forum?)
  #   def can_read_forem_forum?(forum)
  #     true
  #   end
  # end

  # unless method_defined?(:can_create_forem_topics?)
  #   def can_create_forem_topics?(forum)
  #     true
  #   end
  # end

  # unless method_defined?(:can_reply_to_forem_topic?)
  #   def can_reply_to_forem_topic?(topic)
  #     true
  #   end
  # end

  # unless method_defined?(:can_edit_forem_posts?)
  #   def can_edit_forem_posts?(forum)
  #     true
  #   end
  # end

  # unless method_defined?(:can_destroy_forem_posts?)
  #   def can_destroy_forem_posts?(forum)
  #     true
  #   end
  # end

  # unless method_defined?(:can_read_forem_topic?)
  #   def can_read_forem_topic?(topic)
  #     !topic.hidden? || forem_admin?
  #   end
  # end

  # unless method_defined?(:can_moderate_forem_forum?)
  #   def can_moderate_forem_forum?(forum)
  #     forum.moderator?(self)
  #   end
  # end

  extend Forem::Autocomplete
  include Forem::DefaultPermissions

  has_many :forem_posts, :class_name => "Forem::Post", :foreign_key => "user_id"
  has_many :forem_topics, :class_name => "Forem::Topic", :foreign_key => "user_id"
  has_many :forem_memberships, :class_name => "Forem::Membership", :foreign_key => "member_id"
  has_many :forem_groups, :through => :forem_memberships, :class_name => "Forem::Group", :source => :group

  def forem_moderate_posts?
    Forem.moderate_first_post && !forem_approved_to_post?
  end
  alias_method :forem_needs_moderation?, :forem_moderate_posts?

  def forem_approved_to_post?
    forem_state == 'approved'
  end

  def forem_spammer?
    forem_state == 'spam'
  end

  # Using +to_s+ by default for backwards compatibility
  def forem_name
    to_s
  end unless method_defined? :forem_name

  # Using +email+ by default for backwards compatibility. This attribute
  # it's optional
  def forem_email
    try :email
  end unless method_defined? :forem_email
end

class NormalUser::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:email, :name, :phone, :password, :password_confirmation)
  end
end
