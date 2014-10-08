class AddAdditionalServicesToCarWashes < ActiveRecord::Migration
  def change
    add_column :car_washes, :additional_services, :text

    execute <<-SQL
      UPDATE car_washes SET additional_services = services
    SQL
  end
end
