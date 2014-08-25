class AddVideoTitle1ToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :video_title1, :string
  end
end
