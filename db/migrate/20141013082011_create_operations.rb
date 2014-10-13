class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.belongs_to :car_wash
      t.decimal :value, scale: 2, precision: 10
      t.string :transaction_id
    end
  end
end
