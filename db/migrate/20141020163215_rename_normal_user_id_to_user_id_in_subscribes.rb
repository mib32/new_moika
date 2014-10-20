class RenameNormalUserIdToUserIdInSubscribes < ActiveRecord::Migration
  def change
    rename_column :subscribes, :normal_user_id, :user_id
  end
end
