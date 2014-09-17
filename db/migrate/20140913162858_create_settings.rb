class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :app_name
      t.string :ad_1_title
      t.string :ad_1_text
      t.string :ad_2_title
      t.string :ad_2_text
      t.timestamps
    end

    add_index :settings, :app_name, :unique => true
  end
end
