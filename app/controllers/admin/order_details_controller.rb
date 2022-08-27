class Admin::OrderDetailsController < ApplicationController
 def update
     @order_detail = OrderDetail.find(params[:order_detail][:order_detail_id])
  if @order_detail.update(order_detail_params)
   flash[:notice] = "対応ステータスを更新しました"
   redirect_to admin_order_path(@order_detail.order.id)

  else
   render :show, alert: "対応ステータスを更新できませんでした"
  end
 end

 private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :tax_price, :making_status, :created_at)
  end
end