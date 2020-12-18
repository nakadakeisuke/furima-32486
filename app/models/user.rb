class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  validates :email, unique: true
  
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\z/
  　validates :password,　presence: true 
               format: { with: VALID_PASSWORD_REGEX,
                message: "は半角英数字をそれぞれ一文字以上含む必要があります"}         
end
