class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index,:new]

  def index
  end

  def new
  end

  def create
    @items = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)

end
