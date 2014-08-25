class CreateBannersConfigs < ActiveRecord::Migration
  def change
    create_table :banners_configs do |t|
      t.string :place
      t.string :type

      t.timestamps
    end
  end
end
