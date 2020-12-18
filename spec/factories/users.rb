FactoryBot.define do
  factory :user do
    nickname              {"いいい"}
    first_name            {"あああ"}
    first_name_kana       {"カタカナ"}
    last_name             {"あああ"}
    last_name_kana        {"カタカナ"}
    birthday              {20200101}
    email                 {"aaa@aaa"}
    password              {"0000000"}
    password_confirmation {"0000000"}
  end
end