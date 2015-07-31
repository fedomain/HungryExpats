module Admin
	class OrdersController < AdminController
		before_action :set_order, only: [:show, :edit, :update, :destroy]
		before_action :set_customer, only: [:index, :show, :new, :edit, :create]

	  def index
	  	@orders = Order.where('is_deleted = 0 and customer_id = ?', params[:customer_id]).order('created_at DESC')
	  end

	  def show
	  end

	  def new
	  	@order = Order.new
	  end

	  def edit
	  end

	  def create
	  	@order = @customer.orders.create(order_params)

	  	if @order.save
	  		redirect_to admin_customer_order_path(@order.customer_id, @order.id)
	  	else
	  		render 'new'
	  	end
	  end

	  def update
	  	if @order.update(order_params)
	  		redirect_to admin_customer_order_path(@order.customer_id, @order.id)
	  	else
	  		render 'edit'
	  	end
	  end

	  def destroy
	  	@order.update_attribute(:is_deleted, 1)

	  	redirect_to admin_customer_orders_path
	  end

	  private

	  def set_order
	  	@order = Order.find(params[:id])
	  end

	  def set_customer
	  	@customer = Customer.find(params[:customer_id])
	  end

	  def order_params
	  	params.require(:order).permit(:order_no, :restaurant_id, :address)
	  end
	end
end