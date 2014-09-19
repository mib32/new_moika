class AddMqMessageToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :mq_message, :string
  end
end
