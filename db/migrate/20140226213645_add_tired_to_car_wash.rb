class AddTiredToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :tired, :boolean, default: false
  end
end
