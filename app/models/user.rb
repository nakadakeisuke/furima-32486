class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :last_name, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/,message: "全角漢字、ひらがな、カタカナのみで入力して下さい"}
  validates :first_name, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/,message: "全角漢字、ひらがな、カタカナのみで入力して下さい"}
  validates :last_name_kana, presence: true,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "全角カタカナのみで入力して下さい"}
  validates :last_name_kana, presence: true,format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "全角カタカナのみで入力して下さい"}
  validates :birthday, presence: true
  validates :email, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message:'には英字と数字の両方を含めて設定してください' }
  #validates :password,　presence: true,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\z/,message: "は半角英数字をそれぞれ一文字以上含む必要があります"} 
end
#:rememberable,