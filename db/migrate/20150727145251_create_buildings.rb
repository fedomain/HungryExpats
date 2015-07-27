class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.integer :city_area_id

      t.timestamps null: false
    end
  end
end
