class AddWorkingTimeToCarWashes < ActiveRecord::Migration
  def change
    add_column :car_washes, :working_time, :string
  end
end
