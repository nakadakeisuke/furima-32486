FactoryBot.define do
  factory :item do
    name {"商品名"}
    description {"商品説明"}
    condition_id {2}
    category_id {2}
    shipping_charge_id {2}
    prefecture_id {2}
    price {500}
    shipping_day_id {2}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/icon_camera.png'), filename: 'icon_camera.png')
    end
  end
end
