class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :phone
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :phone_verification_code
      t.boolean :has_agreed, :default => false
      t.boolean :is_active, :default => true

      t.timestamps null: false
    end
  end
end
