class AddGreyToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :grey, :boolean, default: false
  end
end
