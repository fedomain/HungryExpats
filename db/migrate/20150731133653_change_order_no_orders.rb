class ChangeOrderNoOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :order_no, :string
  end
end
