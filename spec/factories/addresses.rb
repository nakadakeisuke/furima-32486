FactoryBot.define do
  factory :address do
    post_code       {"555-5555"}
    prefecture_id   {"2"}
    municipality    {"横浜市中区"}
    address         {"テスト1-1-1"}
    phone           {"09000000000"}
    buy_id          {"1"}
    association :buy
  end
end
