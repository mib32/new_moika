class CopyFromSettingsToAds < ActiveRecord::Migration
  def change
    parent_name = Rails.application.class.parent_name
    settings =  Settings.find_by_app_name parent_name
    if settings.nil?
      Settings.create!(app_name: 'Moika')
    end
    ads = CubeAd.all.limit(5)
    5.times do |i|
      ad = ads[i]
      ad.text = settings.send("cl_message_#{i}_text")
      ad.url = settings.send("cl_message_#{i}_url")
      ad.save!
    end
  end
end
