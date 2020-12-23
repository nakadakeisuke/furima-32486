class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :price, :name, :category_id, :condition_id, :description, :prefecture_id, :shipping_charges_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end
