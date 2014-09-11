class SetOrderInNavs < ActiveRecord::Migration
  def change
    rename_column :navs, :order, :position
    Nav.all.each_with_index do |n,i|
      n.update(:position => i+1 )
    end
  end
end
