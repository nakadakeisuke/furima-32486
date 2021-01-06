require 'rails_helper'
  describe Address do
    before do
      @address = FactoryBot.build(:address)
    end

    describe '購入機能' do
      context '購入がうまくいく時' do
        it " post_code,prefecture_id,municipality,address,phone,buy_idがあれば購入できる" do
          expect(@address).to be_valid
        end
    
      context '購入がうまくいかない時' do    
        it "post_codeがない場合は登録できない" do
          @address.post_code = nil
          @address.valid?
        end
        it "prefecture_idがない場合は登録できない" do
          @address.prefecture_id = 1
          @address.valid?
        end
        it "municipalityがない場合は登録できない" do
          @address.municipality = nil
          @address.valid?
        end
        it "addressがない場合は登録できない" do
          @address.address = nil
          @address.valid?
        end
        it "phoneがない場合は登録できない" do
          @address.phone = nil
          @address.valid?
        end
        it "phoneがない場合は登録できない" do
          @address.phone = nil
          @address.valid?
        end
        it "post_codeは-なしでは購入できない" do
          @address.post_code = "1234567"
          @address.valid?
        end
        it "municipalityが半角では購入できない" do
          @address.municipality = "kridkr"
          @address.valid?
        end
      end
      end
    end
  end