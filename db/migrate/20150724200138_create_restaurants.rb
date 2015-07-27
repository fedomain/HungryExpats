class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :picture
      t.string :phone_1
      t.string :phone_2
      t.string :qq
      t.string :qr_code
      t.integer :minimum_order
      t.integer :delivery_charge
      t.integer :star_rating
      t.boolean :is_active, :default => true

      t.timestamps null: false
    end
  end
end
