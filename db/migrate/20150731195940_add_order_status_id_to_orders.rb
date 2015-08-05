class AddOrderStatusIdToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :order_status, index: true, foreign_key: true
  end
end
