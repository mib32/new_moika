class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.belongs_to :car_wash, index: true

      t.timestamps
    end
  end
end
