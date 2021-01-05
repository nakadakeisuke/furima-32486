FactoryBot.define do
  factory :buy do
    user_id     {"2"}
    item_id     {"8"}
    association :user
    association :item


  end
end
