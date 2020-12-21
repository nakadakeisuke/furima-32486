require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

 describe 'ユーザー新規登録' do
  context '新規登録がうまくいく時' do
    it "nicknameとemail、password、password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayがあれば登録できる" do
      expect(@user).to be_valid
    end
  end

  context '新規登録がうまくいかない時' do    
    it "nikcnameがない場合は登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailがない場合は登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "first_nameがない場合は登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameがない場合は登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_name_kanaがない場合は登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "last_name_kanaがない場合は登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "birthdayがない場合は登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end 
    it "first_nameが英語の場合は登録できない" do
      @user.first_name = "ppp"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name enter only full-width kanji, hiragana, and katakana")
    end
    it "last_nameが英語の場合は登録できない" do
      @user.last_name = "ppp"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name enter only full-width kanji, hiragana, and katakana")
    end
    it "first_name_kanaがカタカナ以外の場合は登録できない" do
      @user.first_name_kana = "阿"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana enter only full-width kanji, katakana")
    end
    it "last_name_kanaがカタカナ以外の場合は登録できない" do
      @user.last_name_kana = "火"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana enter only full-width kanji, katakana")
    end
    it " passwordが6文字以上でないと登録できない" do
      @user.password = "aaa12"
      @user.password_confirmation = "aaa12"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが英語のみの場合は登録できない" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password include both letters and numbers in")  
    end
    it "passwordとpassword_confirmationが合致しない場合は登録できない" do
      @user.password = "aaa123"
      @user.password_confirmation = "123aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")  
    end
    it "emailに@がない場合は登録できない" do
      @user.email = "mailmail"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが半角数字のみの場合は登録できない" do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password include both letters and numbers in")  
    end
    it "passwordが全角英数字のみの場合は登録できない" do
      @user.password = "ｌｄｆ１２３"
      @user.password_confirmation = "ｌｄｆ１２３"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password include both letters and numbers in")  
    end
    it "emailが登録済みの時は登録できない" do
      user1 = create(:user, email:"a@a") 
      user2 = build(:user, nickname: "a", email: "a@a")
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
  end
 end
end
