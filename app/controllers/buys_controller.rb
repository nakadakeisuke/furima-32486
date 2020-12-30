class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
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
    params.permit(:post_code, :prefecture_id, :municipality, :address, :building, :phone, :buy).merge(user_id: current_user.id,item_id:params[:item_id])
  end

end
