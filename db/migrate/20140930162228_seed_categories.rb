class SeedCategories < ActiveRecord::Migration
  def change
    Category.destroy_all
    cats = [
  {name: 'wi-fi', image: 'wi-fi'},
  {name: 'кафе', image: 'cafe' },
  {name: 'шиномонтаж', image: 'tires'},
  {name: 'заправочная станция', image: 'gasoline'},
  {name: 'видеотрансляция', image: 'live' },
  {name: 'магазин', image: 'store'},
  {name: 'автосервис', image: 'repair'},
  {name: 'дополнительные услуги', image: 'add_svc' }]

    cats.each do |category|
      Category.create! name: category[:name], image: category[:image]
    end
  end
end
