class AddGasolinedToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :gasolined, :boolean, default: false
  end
end
