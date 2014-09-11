class AddOrderToNavs < ActiveRecord::Migration
  def change
    add_column :navs, :order, :integer
  end
end
