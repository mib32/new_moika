class AddDiscountedToCarWash < ActiveRecord::Migration
  def change
    add_column :car_washes, :discounted, :boolean, default: false
  end
end
