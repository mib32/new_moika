class CopyClientVideoBannersToVideo < ActiveRecord::Migration
  def change
    ClientVideoBanner.where('filename is not null').each do |b|
      Video.create! url: b.filename, car_wash_id: b.car_wash_id
    end
  end
end
