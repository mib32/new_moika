class AddBannerIdToBannersConfig < ActiveRecord::Migration
  def change
    add_column :banners_configs, :banner_id, :integer, index: true
  end
end
