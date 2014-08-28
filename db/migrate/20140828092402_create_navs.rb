class CreateNavs < ActiveRecord::Migration
  def change
    create_table :navs do |t|
      t.string :name
      t.string :path
      t.string :image_url
      t.boolean :hidden_xs

      t.timestamps
    end
  end
end
