class UserBuy
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building, :phone, :buy

 with_options presence: true do
   validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
   validates :address
   validates :phone, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
 end
   validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone: phone)
    Buy.create(user_id: user_id, item_id: item_id)
  end
end