class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @item.save!

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path, notice: "You have created item successfully."
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to admin_items_path, notice: "You have updated item successfully."
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :excluding_tax_price, :genre_id, :item_id, :image, :order_details_id, :is_active)
  end
end
