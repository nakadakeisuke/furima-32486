FactoryBot.define do
  factory :buy do
    buy_id {"2"}
    association :user
    association :item
  end
end
