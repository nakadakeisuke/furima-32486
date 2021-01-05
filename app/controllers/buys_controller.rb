class BuysController < ApplicationController
  before_action :item_find, only:[:index, :create]

  def index
    @user_buy = UserBuy.new
  end

  def create
    @user_buy = UserBuy.new(buy_params)
      if @user_buy.valid?
        pay_item
        @user_buy.save
        redirect_to root_path
      else
        render :index
      end
  end

  private
  def item_find
    @item = Item.find(params[:item_id])
  end
  
  def buy_params
    params.require(:user_buy).permit(:post_code, :prefecture_id, :municipality, :address, :building, :phone, :buy, :item_id, :token).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
