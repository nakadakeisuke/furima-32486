require 'rails_helper'
  describe UserBuy do
    before do
      @user_buy = FactoryBot.build(:user_buy)
    end

    describe '購入機能' do
      context '購入がうまくいく時' do
        it " user_id,item_id,post_code,prefecture_id,municipality,address,phone,buy_idがあれば購入できる" do
          expect(@user_buy).to be_valid
        end
        
      context '購入がうまくいかない時' do    
        it "user_idがない場合は登録できない" do
          @user_buy.user_id = nil
          @user_buy.valid?
        end
        it "item_idがない場合は登録できない" do
          @user_buy.item_id = nil
          @user_buy.valid?
        end
        it "post_codeがない場合は登録できない" do
          @user_buy.post_code = nil
          @user_buy.valid?
        end
        it "prefecture_idがない場合は登録できない" do
          @user_buy.prefecture_id = 1
          @user_buy.valid?
        end
        it "municipalityがない場合は登録できない" do
          @user_buy.municipality = nil
          @user_buy.valid?
        end
        it "addressがない場合は登録できない" do
          @user_buy.address = nil
          @user_buy.valid?
        end
        it "phoneがない場合は登録できない" do
          @user_buy.phone = nil
          @user_buy.valid?
        end
        it "phoneがない場合は登録できない" do
          @user_buy.phone = nil
          @user_buy.valid?
        end
        it "post_codeは-なしでは購入できない" do
          @user_buy.post_code = "1234567"
          @user_buy.valid?
        end
        it "municipalityが半角では購入できない" do
          @user_buy.municipality = "kridkr"
          @user_buy.valid?
        end
      end
      end
    end
  end