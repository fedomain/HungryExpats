class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :picture
      t.integer :spiciness
      t.boolean :is_available, :default => true
      t.boolean :has_options, :default => false
      t.boolean :is_active, :default => true

      t.references :restaurant, index: true

      t.timestamps null: false
    end

    add_foreign_key :dishes, :restaurants
  end
end
