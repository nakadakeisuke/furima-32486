require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

 describe '出品機能' do
  context '出品がうまくいく時' do
    it "nameとcategory_id、price、description,condition_id,shipping_charges_id,prefecture_id,shipping_daysがあれば登録できる" do
      expect(@item).to be_valid
    end
  end

  context '出品がうまくいかない時' do    
    it "nameがない場合は登録できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "descriptionがない場合は登録できない" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "priceがない場合は登録できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "Categoryが--の場合は登録できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "shipping_chargesが--の場合は登録できない" do
      @item.shipping_charges_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
    end
    it "shipping_daysが--の場合は登録できない" do
      @item.shipping_days_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
    end
    it "prefectureが--の場合は登録できない" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "conditionが--の場合は登録できない" do
      @item.condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "imageがない場合は登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
 end
end
