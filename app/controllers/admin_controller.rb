class AdminController < ApplicationController
  def index
  	@orders = Order.where('is_deleted = 0').order('order_no DESC')
  end
end
