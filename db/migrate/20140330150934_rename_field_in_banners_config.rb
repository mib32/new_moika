class RenameFieldInBannersConfig < ActiveRecord::Migration
  def change
    rename_column :banners_configs, :type, :mode
  end
end
