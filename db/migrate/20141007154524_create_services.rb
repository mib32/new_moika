class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name

      t.timestamps
    end

    Service.create!(name:'Эконом')
    Service.create!(name:'Стандарт')
    Service.create!(name:'Комплекс')
  end
end
