class Admin::OrderDetailsController < ApplicationController
 def update
  if @order_detail.update(order_detail_params)
   flash[:notice] = "対応ステータスを更新しました"
   redirect_to admin_order_detail_path(@order_detail)
  else
   render :show, alert: "対応ステータスを更新できませんでした"
  end
end
