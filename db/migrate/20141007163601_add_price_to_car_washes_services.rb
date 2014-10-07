class AddPriceToCarWashesServices < ActiveRecord::Migration
  def change
    add_column :car_washes_services, :price, :string
  end
end
