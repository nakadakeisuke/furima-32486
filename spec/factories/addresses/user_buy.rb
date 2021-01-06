FactoryBot.define do
  factory :user_buy do
    post_code       {"555-5555"}
    prefecture_id   {2}
    municipality    {"横浜市中区"}
    address         {"テスト1-1-1"}
    phone           {"09000000000"}
    token           {"123edfrgt"}
    building        {"建物"}
  end
end
