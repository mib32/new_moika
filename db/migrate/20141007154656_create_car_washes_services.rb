class CreateCarWashesServices < ActiveRecord::Migration
  def change
    create_table :car_washes_services do |t|
      t.integer :car_wash_id
      t.integer :service_id
      t.timestamps
    end
  end
end
