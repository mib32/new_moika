class AddVideoTitle2ToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :video_title2, :string
  end
end
