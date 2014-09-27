class AddWidgetContentToCarWashes < ActiveRecord::Migration
  def change
    add_column :car_washes, :widget_content, :string
  end
end
