class ChangeWidgetType < ActiveRecord::Migration
  def change
    CarWash.where('widget_type is NULL').update_all("widget_type = 'normal'")
    change_column :car_washes, :widget_type, :string, default: 'normal'
  end
end
