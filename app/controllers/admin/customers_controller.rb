class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def customers_params
    params.require(:customer).permit(:last_name, :first_name, :email, :id, :is_deleted, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number)
  end

end
