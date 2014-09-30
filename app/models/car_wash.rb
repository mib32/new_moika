class CarWash < ActiveRecord::Base
  default_scope {order('rating DESC').order('id DESC')}
  scope :grey, -> { where(grey: true) }
  scope :non_grey, -> { where(grey: false) }
  after_create :create_payment
  after_validation :geocode,
    if: ->(obj){ obj.lat.nil? || obj.lon.nil? }

  has_many :users
  has_many :requests
  has_many :messages
  has_many :payments
  has_many :invoices
  # has_many :subscribes
  # has_many :normal_users, through: :subscribes
  has_many :reviews
  has_many :images, as: :parent
  has_many :videos
  has_and_belongs_to_many :categories

  geocoded_by :address, :latitude  => :lat, :longitude => :lon

  
  def activate!
    self.update(activated: true)
  end

  def unread_requests_count
    self.requests.unread.count
  end

  def unread_messages_count
    self.messages.unread.count
  end

  def signal_human
    self.signal ? I18n.t('signal_open'):I18n.t('signal_close')
  end

  # def update_signals
  #   logger.debug "vatagin_from update signal_changed:#{self.title}:#{self.signal_changed}"
  # end



  def categories_concated
    categories.map(&:name).join(", ")
  end

  protected
  
    def create_payment
      self.payments << Payment.new(amount: 6000.00)
    end

  private
    def lat_and_lon_nil?
      self.lat.nil? && self.lon.nil?
    end
end
