class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
   
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :shipping_charges_id
    validates :prefecture_id
    validates :shipping_days_id
    validates :condition_id
  end
end
