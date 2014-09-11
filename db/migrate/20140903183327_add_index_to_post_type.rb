class AddIndexToPostType < ActiveRecord::Migration
  def change
    add_index :posts, :type
  end
end
