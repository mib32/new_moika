class AddWidgetToCarWashes < ActiveRecord::Migration
  def change
    add_column :car_washes, :widget, :string
  end
end
