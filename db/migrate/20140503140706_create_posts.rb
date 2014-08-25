class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.datetime :published_at, index: true
      t.boolean :published
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
