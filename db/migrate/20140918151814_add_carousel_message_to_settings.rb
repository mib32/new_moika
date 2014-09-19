class AddCarouselMessageToSettings < ActiveRecord::Migration
  def change
    6.times do |i|
      add_column :settings, "cl_message_#{i}_text", :string
      add_column :settings, "cl_message_#{i}_url", :string
    end
  end
end
