class AddWashAtCarModelLicensePlateNoToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :wash_at, :datetime
    add_column :requests, :car_model, :string
    add_column :requests, :license_plate_no, :string
  end
end
