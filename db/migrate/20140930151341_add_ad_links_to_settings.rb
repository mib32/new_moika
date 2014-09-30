class AddAdLinksToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :ad_1_url, :string
    add_column :settings, :ad_2_url, :string
  end
end
