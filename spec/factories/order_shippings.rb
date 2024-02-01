FactoryBot.define do
  factory :order_shipping do
    association :user_id
    association :item_id
    postal_code            {"123-4567"}
    prefecture_id          {2}
    city                   {"練馬区"}
    address                {"貫井3-3-3"}
    building               {"ビル"}
    phone_number           {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
