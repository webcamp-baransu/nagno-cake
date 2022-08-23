class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
    @customer = current_customer
    @shipping_addresses = @customer.shipping_addresses
  end
  
  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    @shipping_address.save
     redirect_to shipping_addresses_path
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end
  
  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
       flash[:success] = "配送先の変更内容を保存しました。"
       redirect_to shipping_addresses_path
    else
       flash[:danger] = "配送先の変更内容に不備があります。"
       redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.customer_id = current_customer.id
    @shipping_address.destroy
    flash[:success] = "配送先の削除が完了しました。"
    redirect_to shipping_addresses_path
  end
  
  
  private
  def shipping_address_params
    params.require(:shipping_address).permit( :postal_code, :address, :name)
  end
end
