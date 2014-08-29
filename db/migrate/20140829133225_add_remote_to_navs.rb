class AddRemoteToNavs < ActiveRecord::Migration
  def change
    add_column :navs, :remote, :boolean
  end
end
