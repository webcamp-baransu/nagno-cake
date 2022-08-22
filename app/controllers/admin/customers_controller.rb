class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:customer).permit(:last_name, :first_name, :email, :id, :is_deleted)
  end

end
