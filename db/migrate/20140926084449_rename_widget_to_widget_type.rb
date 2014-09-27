class RenameWidgetToWidgetType < ActiveRecord::Migration
  def change
    rename_column :car_washes, :widget, :widget_type
  end
end
