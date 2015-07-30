class CreateOpeningHours < ActiveRecord::Migration
  def change
    create_table :opening_hours do |t|
      t.integer :day
      t.time :start_time
      t.time :end_time
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
