class AddTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, null: false, default: 'car_wash_owner'
  end
end
