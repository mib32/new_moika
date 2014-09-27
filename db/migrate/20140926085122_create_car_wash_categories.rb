class CreateCarWashCategories < ActiveRecord::Migration
  def change

    create_table :categories do |t|
      t.string :name
      t.string :image
      t.timestamps
    end

    create_table :car_washes_categories do |t|
      t.integer :car_wash_id
      t.integer :category_id
      t.timestamps
    end

  end
end