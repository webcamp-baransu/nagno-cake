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
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :excluding_tax_price, :genre_id, :item_id, :image, :order_details_id)
  end
end
