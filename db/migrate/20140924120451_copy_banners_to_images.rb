class CopyBannersToImages < ActiveRecord::Migration
  def change
    Banner.order('id asc').where('file is not null').each do |b|
      begin
        puts "banner id: #{b.id} banner file: #{b.file}"
        Image.create!(image: b.file, parent_id: b.car_wash_id, parent_type: 'CarWash')
        puts "ok"
      rescue Errno::ENOENT
        puts "whoops banner id:#{b.id}"
      end
    end

  end
end
