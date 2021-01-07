class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :destroy]
  before_action :item_find, only:[:edit, :update, :show, :destroy, :buy]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
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
    if current_user.id != @item.user_id || @item.buy.present?
         redirect_to action: :index
    end
    # unless current_user.id == @item.user_id && @item.buy.present
    #   redirect_to action: :index
    # end
    # if @item.buy.present?
    #   redirect_to root_path
    # end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
   if @item.destroy
      redirect_to root_path
   else
      render :show
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
