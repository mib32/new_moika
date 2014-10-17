class AddTypeToPostCategories < ActiveRecord::Migration
  def change
    add_column :post_categories, :type, :string
  end
end
