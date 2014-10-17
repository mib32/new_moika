class RemovePostIdFromPostCategories < ActiveRecord::Migration
  def change
    remove_column :post_categories, :post_id, :integer
  end
end
