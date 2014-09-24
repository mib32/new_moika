class ChangeRatingFormatInCarWashes < ActiveRecord::Migration
  def change
    CarWash.all.each do |cw|
      if cw.rating > 5
        cw.rating = 5
        cw.save!
      end
    end
    change_column :car_washes, :rating, :decimal, precision: 5, scale: 4
  end
end
