class Public::CustomersController < ApplicationController
  def show

  end

  def edit
    @customer = current_customer
  end

  def unsubscribe
   @customer = current_customer
  end

  def update
    @customer = current_customer

      if @customer.update(customer_params)
      flash[:notice] = "successfully"
      redirect_to customers_path

      else
      render :show
      end
  end

  def withdrawa
   @customer = current_customer
   @customer.update_columns(is_deleted: true)
   if @customer.is_deleted == true
      sign_out current_customer
   end
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit( :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
