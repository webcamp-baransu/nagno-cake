class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
    @customer = current_customer
    @shipping_addresses = @customer.shipping_addresses
  end

  def edit
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
end
