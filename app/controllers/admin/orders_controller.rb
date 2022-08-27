class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = @order.total_payment - @order.postage
    @order_details = OrderDetail.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    flash[:notice] = "注文ステータスの変更をしました"
    redirect_to admin_order_path(@order.id)
  end

 private

  def order_params
    params.require(:order).permit(:customer_id, :postage, :last_name, :first_name, :payment_method, :id, :total_payment, :name, :address, :postal_code, :status, :created_at)
  end

end
