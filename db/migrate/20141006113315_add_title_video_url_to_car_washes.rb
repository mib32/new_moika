class AddTitleVideoUrlToCarWashes < ActiveRecord::Migration
  def change
    add_column :car_washes, :title_video_url, :string

    CarWash.all.each do |cw|
      if cw.videos.any?
        cw.update!(title_video_url: cw.videos.first.url)
      end
    end
  end
end
