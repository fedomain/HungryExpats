class AddIsDeletedToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :is_deleted, :boolean, :default => false
  end
end
