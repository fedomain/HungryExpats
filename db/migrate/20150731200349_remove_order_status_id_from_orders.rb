class RemoveOrderStatusIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :orderstatus_id, :integer
  end
end
