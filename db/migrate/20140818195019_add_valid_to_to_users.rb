class AddValidToToUsers < ActiveRecord::Migration
  def change
    add_column :users, :valid_to, :datetime
  end
end
