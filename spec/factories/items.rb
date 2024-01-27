FactoryBot.define do
  factory :item do
    association :user
    name                   {"商品名"}
    description            {"商品詳細"}
    category_id            {2}
    sales_status_id        {2}
    shipping_fee_status_id {2}
    prefecture_id          {2}
    scheduled_delivery_id  {2}
    price                  {500}
  end
end
