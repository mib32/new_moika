class AddReadToSubscribe < ActiveRecord::Migration
  def change
    add_column :subscribes, :read, :boolean, default: false
  end
end
