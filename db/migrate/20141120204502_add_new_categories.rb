class AddNewCategories < ActiveRecord::Migration
  def change
    cats = [
  {name: 'мойка грузовиков', image: 'freighter'},
  {name: 'аренда (прокат) авто', image: 'rent-a-car'},
  {name: 'мойка-самообслуживание', image: 'self-care' }]

    cats.each do |category|
      Category.create! name: category[:name], image: category[:image]
    end
  end
end
