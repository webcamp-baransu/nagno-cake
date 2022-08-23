class Public::CustomersController < ApplicationController
  def show

  end

  def edit
    @customer = current_customer
  end

  def unsubscribe

  end

  def update
    @customers_url = customer.find(params[:id])

      if @customer.update(customer_params)
      flash[:notice] = "successfully"
      redirect_to customers_path(@customer.id)

      else
      render :show

      end

  end

  def withdrawa

  end


end
