class AddUpdatedWidgetAtToCarWashes < ActiveRecord::Migration
  def change
    add_column :car_washes, :updated_widget_at, :datetime
  end
end
