class AddBrendedToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :brended, :boolean, default: false
  end
end
