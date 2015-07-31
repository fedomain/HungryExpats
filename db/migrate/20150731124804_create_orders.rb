class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_no
      t.references :customer, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true
      t.string :address
      t.string :city_area
      t.string :building
      t.string :city
      t.string :province
      t.string :country
      t.float :delivery_charge
      t.float :price_adjustment

      t.timestamps null: false
    end
  end
end
