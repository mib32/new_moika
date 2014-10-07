class AddIndexToCarWashesServices < ActiveRecord::Migration
  def change
    add_index :car_washes_services, [:car_wash_id, :service_id], :unique => true
    add_index :car_washes_services, :car_wash_id

    add_index :car_washes_categories, :car_wash_id
  end
end
