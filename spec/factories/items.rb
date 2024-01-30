FactoryBot.define do
  factory :item do
    association :user, :item, :order
    postal_code            {"123-4567"}
    prefecture_id          {2}
    city                   {"テスト"}
    address                {"テスト"}
    building               {"テスト"}
    phone_number           {"09012345678"}
  end
end
