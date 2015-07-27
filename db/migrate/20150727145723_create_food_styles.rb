class CreateFoodStyles < ActiveRecord::Migration
  def change
    create_table :food_styles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
