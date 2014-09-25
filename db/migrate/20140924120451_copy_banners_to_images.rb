class CopyBannersToImages < ActiveRecord::Migration
  def change
    Banner.where('file is not null').each do |b|
      Image.create!(image: b.file, parent_id: b.car_wash_id, parent_type: 'CarWash')
    end

  end
end
