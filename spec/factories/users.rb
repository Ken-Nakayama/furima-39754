FactoryBot.define do
  factory :user do
    nickname              {"ニックネーム"}
    email                 {Faker::Internet.email}
    password              {"aaaaa1"}
    password_confirmation {password}
    last_name             {"名字みょうじミョウジ"}
    first_name            {"名前なまえナマエ"}
    last_name_kana        {"ミョウジ"}
    first_name_kana       {"ナマエ"}
    birth_date            {"1981-10-28"}
  end
end