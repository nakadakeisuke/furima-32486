class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :name
    validates :description

   VALID_PRICEL_HALF =/\A[0-9]+\z/
     validates :price format: {with: VALID_PRICEL_HALF},length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
       greater_than: 300, less_than: 10000000
  end
  with_options numericality: { other_than: 1 } 
    validates :category_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_days_id
  end
end
