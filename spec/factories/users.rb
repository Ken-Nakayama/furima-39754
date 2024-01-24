FactoryBot.define do
  factory :user do
    nickname              {"ニックネーム"}
    email                 {Faker::Internet.email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"ミョウジ"}
    first_name            {"名前"}
    last_name_kana        {"ミョウジ"}
    first_name_kana       {"ナマエ"}
    birth_date            {"1981-10-28"}
  end
end