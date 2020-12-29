class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @user_buy = UserBuy.new(buy_params)
      if @user_buy.valid?
        @user_buy.save
        redirect_to action: :index
      else
        render action: :new 
      end
  end

  private
  def buy_params
    params.require(:user_buy).permit(:post_code, :prefecture_id, :minicipality, :address, :building, :phone, :buy).merge(:user_id, :item_id)
  end

end
