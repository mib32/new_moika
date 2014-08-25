class AddRepairedToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :repaired, :boolean, default: false
  end
end
