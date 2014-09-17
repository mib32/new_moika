class CreateReviews < ActiveRecord::Migration
  def change
    drop_table :reviews
    create_table :reviews do |t|
      t.string :text
      t.integer :rating
      t.belongs_to :car_wash, index: true

      t.timestamps
    end
  end
end
