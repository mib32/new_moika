class CopyBannersToImages < ActiveRecord::Migration
  def change
    Banner.where('file is not null').each do |b|
      puts "banner id: #{b.id " banner file:" b.file}"
      Image.create!(image: b.file, parent_id: b.car_wash_id, parent_type: 'CarWash')
      puts "ok"
    end

  end
end
