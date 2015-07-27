class AddDishCategoryidToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :dish_category_id, :integer
  end
end
