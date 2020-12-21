class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :last_name, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/,message: "enter only full-width kanji, hiragana, and katakana"}
  validates :first_name, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/,message: "enter only full-width kanji, hiragana, and katakana"}
  validates :last_name_kana, presence: true,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "enter only full-width kanji, katakana"}
  validates :first_name_kana, presence: true,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "enter only full-width kanji, katakana"}
  validates :birthday, presence: true
  validates :email, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message:'include both letters and numbers in' }
  #validates :password, presence: true,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\z/,message: "は半角英数字をそれぞれ一文字以上含む必要があります"} 
end
#:rememberable,