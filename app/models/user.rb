class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, uniqueness: true
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/,message: "enter only full-width kanji, hiragana, and katakana"} do
      validates :last_name
      validates :first_name 
    end
    with_options format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "enter only full-width kanji, katakana"} do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message:'include both letters and numbers in' }
end
