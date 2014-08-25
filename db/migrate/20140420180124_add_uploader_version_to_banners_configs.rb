class AddUploaderVersionToBannersConfigs < ActiveRecord::Migration
  def change
    add_column :banners_configs, :uploader_version, :string
  end
end
