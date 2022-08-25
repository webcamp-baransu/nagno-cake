class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.sum_of_price }+800
  end

  def log
  end

  def thanx
  end

  def index
  end

  def show
  end
  
  def create
  end
end
