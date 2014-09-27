class AddTitleImageToCarWashes < ActiveRecord::Migration
  def change
    add_column :car_washes, :title_image, :integer
  end
end
