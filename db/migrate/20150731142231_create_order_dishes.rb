class CreateOrderDishes < ActiveRecord::Migration
  def change
    create_table :order_dishes do |t|
      t.references :order, index: true, foreign_key: true
      t.references :dish, index: true, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps null: false
    end
  end
end
