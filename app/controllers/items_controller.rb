class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit]
  before_action :item_find, only:[:edit, :update]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :price, :name, :category_id, :condition_id, :description, :prefecture_id, :shipping_charge_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end
