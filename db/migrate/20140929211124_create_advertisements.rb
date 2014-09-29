class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :text
      t.string :url
      t.string :type

      t.timestamps
    end
  end
end
