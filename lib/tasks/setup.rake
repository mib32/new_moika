namespace :setup do
  desc "Add 4 emty banners to each Car Wash"

  task add_empty_admin_banners: :environment do
    puts "Add admin banners"
    puts "_"*10
    puts "Delete ALL Admin Banners"
    AdminBanner.delete_all
    AdminImageBanner.delete_all
    AdminYoutubeBanner.delete_all
    AdminIvideonBanner.delete_all
    AdminSlideshowBanner.delete_all
    puts "_"*10
    puts "Delete Banners Config"
    BannersConfig.delete_all

    PLACES = {
      "top_1" => "AdminYoutubeBanner",
      "top_2" => "AdminImageBanner",
      "top_3" => "AdminIvideonBanner",
      "top_4" => "AdminImageBanner",
      "bottom_1" => "AdminSlideshowBanner",
      "bottom_2" => "AdminYoutubeBanner",
      "bottom_3" => "AdminIvideonBanner",
      "bottom_4" => "AdminYoutubeBanner",
      "left_1" => "AdminImageBanner",
      "left_2" => "AdminImageBanner",
      "left_3" => "AdminImageBanner",
      "comments_1" => "AdminImageBanner",
      "comments_2" => "AdminImageBanner",
      "requests_1" => "AdminImageBanner",
      "requests_2" => "AdminImageBanner"
    }

    SIZES = {
      "top_1"      => "b_385_220",
      "top_2"      => "b_385_220",
      "top_3"      => "b_385_220",
      "top_4"      => "b_385_220",
      "bottom_1"   => "b_385_220",
      "bottom_2"   => "b_385_220",
      "bottom_3"   => "b_385_220",
      "bottom_4"   => "b_385_220",
      "left_1"     => "b_190_160",
      "left_2"     => "b_190_280",
      "left_3"     => "b_190_160",
      "comments_1" => "b_385_220",
      "comments_2" => "b_385_220",
      "requests_1" => "b_385_220",
      "requests_2" => "b_385_220"
    }

    puts "_"*10
    puts "Add new empty banners"

    PLACES.each do |place, banner_type|
      AdminYoutubeBanner.create!(place: place, youtube_url: '//www.youtube.com/embed/qeIeS8RDD98')
      AdminImageBanner.create!(place: place)
      AdminIvideonBanner.create!(place: place, car_wash_id: CarWash.where(videoned:true).last)
      AdminSlideshowBanner.create!(place: place)



      banner_conf = BannersConfig.new(place: place, uploader_version: SIZES[place])
      banner_conf.banner = banner_type.constantize.where(place: place).first
      banner_conf.save!
    end

  end

  task add_empty_client_banners: :environment do
    puts "Add empty banners"
    banners_data = [
      {place: "client_fat_top"},
      {place: "client_thin_bottom"},
      {place: "client_thin_top_1"},
      {place: "client_thin_top_2"}
    ]

    CarWash.find_each do |cw|
      cw.banners.destroy_all
      banners_data.each do |data| 
        puts "Add #{data[:place]} banner to #{cw.title}"
        cw.banners << ClientBanner.new(data)
      end
      puts
    end
  end

  task add_admin_type_banners: :environment do
    puts "Add admin type to banners with empty type"
    Banner.where(type: nil).find_each do |banner|
      banner.update(type: "AdminBanner")
    end
  end

  task add_empty_left_bottom_client_banners: :environment do
    puts "Add empty banners"
    banners_data = [
      {place: "client_thin_top_3"},
      {place: "client_thin_top_4"}
    ]

    CarWash.find_each do |cw|
      banners_data.each do |data| 
        puts "Add #{data[:place]} banner to #{cw.title}"
        cw.banners << ClientBanner.new(data)
      end
      puts
    end
  end

  task add_empty_client_video_banners: :environment do
    puts "Add empty video banners"

    CarWash.find_each do |cw|
      cw.banners.where(type: 'ClientVideoBanner').destroy_all
      cw.banners << ClientVideoBanner.new
    end
  end

  task create_banners_config: :environment do
    puts "create bunners config"
    places = [
      'top_1',
      'top_2',
      'top_3',
      'top_4',
      'bottom_1',
      'bottom_2',
      'bottom_3',
      'bottom_4',
      'left_1',
      'left_2',
      'left_3',
    ]

    BannersConfig.create!(place: 'top_1', mode: "youtube")
    BannersConfig.create!(place: 'top_2', mode: "image")
    BannersConfig.create!(place: 'top_3', mode: "ivideon")
    BannersConfig.create!(place: 'top_4', mode: "image")
    BannersConfig.create!(place: 'bottom_1', mode: "slideshow")
    BannersConfig.create!(place: 'bottom_2', mode: "youtube")
    BannersConfig.create!(place: 'bottom_3', mode: "ivideon")
    BannersConfig.create!(place: 'bottom_4', mode: "youtube")
    BannersConfig.create!(place: 'left_1', mode: "image")
    BannersConfig.create!(place: 'left_2', mode: "image")
    BannersConfig.create!(place: 'left_3', mode: "image")
  end

  task add_first_payment: :environment do
    puts "Add first payment to all car_washes"
    CarWash.find_each do |cw|
      cw.payments << Payment.new(amount: 6000.00)
    end
  end

  task add_signal_type: :environment do
    puts "add signal_type"
    CarWash.find_each do |cw|
      if cw.blink
        cw.signal_type = 'blink'
      elsif cw.videoned
        cw.signal_type = 'videoned'
      elsif cw.action_on_map
        cw.signal_type = 'action_on_map'
      else
        cw.signal_type = 'normal'
      end
      cw.save
    end
  end

end
