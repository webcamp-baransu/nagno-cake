class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    
      if @customer.update(customer_params)
      flash[:notice] = "successfully"
      redirect_to admin_customer_path
      end
  end

  private

  def customer_params
    params.require(:customer).permit(:telephone_number, :last_name, :first_name, :email, :id, :is_deleted, :last_name_kana, :first_name_kana, :postal_code, :address)
  end

end
