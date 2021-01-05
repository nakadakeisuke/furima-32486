require 'rails_helper'
  describe Buy do
    before do
      @buy = FactoryBot.build(:buy)
    end

    describe '購入機能' do
      context '購入がうまくいく時' do
        it "user_idとitem_idがあれば購入できる" do
          expect(@buy).to be_valid
        end
    
      context '購入がうまくいかない時' do    
        it "user_idがない場合は登録できない" do
          @buy.user_id = nil
          @buy.valid?
        end
        it "item_idがない場合は登録できない" do
          @buy.item_id = nil
          @buy.valid?
        end
      end
      end
    end
  end