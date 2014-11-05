require 'open-uri'
require 'nokogiri'

class Currency < ActiveRecord::Base
  attr_accessor :diff

  def self.get_from_cb(date = Time.now)
    ret = [] 
    formatted_date = date.strftime("%d/%m/%Y")
    file_handle = open("http://www.cbr.ru/scripts/XML_daily.asp?date_req=#{formatted_date}")
    puts file_handle
    # file_handle = nil
    unless file_handle.nil?
      document = Nokogiri::XML(file_handle)
      eur_name = document.xpath("//Valute[@ID='R01239']/CharCode").children.first.text
      eur_value = document.xpath("//Valute[@ID='R01239']/Value").children.first.text.sub(',','.').to_d
      usd_name = document.xpath("//Valute[@ID='R01235']/CharCode").children.first.text
      usd_value = document.xpath("//Valute[@ID='R01235']/Value").children.first.text.sub(',','.').to_d
      ret << {name: eur_name, value: eur_value, date: date}
      ret << {name: usd_name, value: usd_value, date: date}
    end
    ret
  rescue SocketError
  end

  def self.save_current_from_cb(current_date = Date.today)
    ary = Currency.get_from_cb(current_date)
    currency = []
    ary.each do |row|
      Currency.create!(name: row[:name], value: row[:value], date: row[:date])
    end
  end

  def self.get_current_usd
    get_current currency_name: 'USD'
  end

  def self.get_current_eur
    get_current currency_name: 'EUR'
  end

  def self.get_current(opt_hash)
    currency = opt_hash.delete(:currency_name)
    current = Currency.where(name: currency, date: Date.today)
    if current.empty?
      save_current_from_cb
      current = Currency.where(name: currency, date: Date.today)
    end
    if current.empty?
      current = Currency.where(name: currency, date: Date.today-1)
    end
    if current.empty?
      current = Currency.where(name: currency, date: Date.today-2)
    end
    current.first.diff = get_dynamics current.first, current.first.date.to_date
    current.first
  end

  def self.test_runner
    logger.debug "vatagin: Currency test_runner invoked..."
    
  end

  def self.get_dynamics(current, date)
    previous = Currency.where(name: current.name, date: date - 1).first
    if previous.nil?
      save_current_from_cb(date - 1)
      previous = Currency.where(name: current.name, date: date - 1).first
    end
    diff = current.value - previous.value
  end

end
