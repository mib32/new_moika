class CarWash < ActiveRecord::Base
  # default_scope {order('rating DESC').order('id DESC')}
  scope :grey, -> { where(grey: true) }
  scope :non_grey, -> { where(grey: false) }
  after_create :create_payment
  after_validation :geocode,
    if: ->(obj){ obj.lat.nil? || obj.lon.nil? }

  attr_accessor :url, :start_hour, :end_hour, :working_time_string, :widget_title

  has_many :users
  has_many :requests
  has_many :messages
  has_many :payments
  has_many :invoices
  has_many :subscribes
  has_many :users, through: :subscribes
  has_many :reviews
  has_many :images, as: :parent
  has_many :videos
  has_and_belongs_to_many :categories
  has_many :car_washes_services
  has_many :services, through: :car_washes_services

  geocoded_by :address, :latitude  => :lat, :longitude => :lon

  # validates_presence_of :contacts, :address, :working_time

  accepts_nested_attributes_for :car_washes_services
  
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
    # categories.map(&:name).join(", ")
    cat_pics = categories.each_with_index.map do |c,i| 
      # byebug
      klass = i % 2 == 1? 'light': ''
      "<div class='cat-pic #{c.image} #{klass}'></div>"
    end
    cat_pics.join("")
  end

  def start_hour
    if working_time.nil?
      return 0
    end
    res = working_time.scan(/(\d*)\s/).last
    if res.present?
      res.last.to_i
    else
      res
    end
  end

  def end_hour
    if working_time.nil?
      return 0
    end
    res = working_time.scan(/\s(\d*)/).last
    if res.present?
      res.last.to_i
    else
      res
    end
  end

  def working_time= value
    if value.kind_of?(Hash)
      w_time = value['start_hour'] + ' ' + value['end_hour']
    else
      w_time = self.working_time_string
    end
    write_attribute(:working_time,w_time)
  end

  def working_time_string= value
    write_attribute(:working_time, value)
  end

  def working_time_string
    w_time = read_attribute(:working_time)
    w_time_arr = w_time.scan(/(\d*)\s(\d*)/) unless w_time.nil?
    if !w_time_arr.nil? && w_time_arr.empty?
      if w_time.is_a?(String)
        return w_time
      else
        return nil
      end
    else
      return ''
    end
  end

  def widget_title
    Widget.find_by_type(widget_type).name unless widget_type == 'normal' || widget_type.nil?
 end

  # def working_time
  #   w_time = read_attribute(:working_time)

  #   unless w_time.nil?
    
  #     time_arr = read_attribute(:working_time).scan(/(\d*)\s(\d*)/)
  #     {:start_hour => time_arr.last.first.to_i, :end_hour => time_arr.last.last.to_i }
  #   else
  #     ""
  #   end
  # end


  protected
  
    def create_payment
      self.payments << Payment.new(amount: 6000.00)
    end

  private
    def lat_and_lon_nil?
      self.lat.nil? && self.lon.nil?
    end
end
