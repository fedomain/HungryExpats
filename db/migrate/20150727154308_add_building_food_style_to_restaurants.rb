class AddBuildingFoodStyleToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :building_id, :integer
    add_column :restaurants, :food_style_id, :integer
  end
end
