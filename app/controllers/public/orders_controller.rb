class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.sum_of_price }+800
    @address = current_customer.shipping_addresses
  end

    
   
   
  def log
    @customer = Customer.find(current_customer.id)
    @cart_items = CartItem.all
    @order = Order.new
    @order.postage = 800
    @item_total_price = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.sum_of_price }
    @total_price = @item_total_price + 800
    if params[:order][:address_option] == "0"
			@order.address = current_customer.address
			@order.postal_code = current_customer.postal_code
			@order.name = current_customer.last_name + current_customer.first_name
	 end
  end
  
    

  def thanx
  end

  def index
  end

  def show
  end
  
  def create
      @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_good = OrderDetail.new
        @order_good.order_id = @order.id
        @order_good.item_id = cart_item.item_id
        @order_good.amount = cart_item.amount
        @order_good.tax_price = cart_item.item.add_tax_price
        @order_good.save
        current_customer.cart_items.destroy_all
      end
      redirect_to orders_thanx_path
    else
      redirect_to new_order_path
    end
     
  end
   private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :postage, :total_payment, :payment_method, :order_status)
  end
end