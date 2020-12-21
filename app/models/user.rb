class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :last_name,format: {with: /\A[ぁ-んァ-ン一-龥]/,message: "enter only full-width kanji, hiragana, and katakana"}
    validates :first_name,format: {with: /\A[ぁ-んァ-ン一-龥]/,message: "enter only full-width kanji, hiragana, and katakana"}
    validates :last_name_kana,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "enter only full-width kanji, katakana"}
    validates :first_name_kana,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "enter only full-width kanji, katakana"}
    validates :birthday
    validates :email
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message:'include both letters and numbers in' }
end
