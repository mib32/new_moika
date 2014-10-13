class AddPremialStatusToCarWashes < ActiveRecord::Migration
  def change
    add_column :car_washes, :premial_status, :string
  end
end
