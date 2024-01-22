## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | text       | null: false                    |
| email              | string     | null: false, unique: true      |
| password           | string     | null: false                    |
| last_name          | text       | null: false                    |
| first_name         | text       | null: false                    |
| last_name_kana     | text       | null: false                    |
| first_name_kana    | text       | null: false                    |
| birth_date         | text       | null: false                    |

### Association
- has_many :items, dependent: :destroy
- has_many :orders, dependent: :destroy


## itemsテーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| user                     | references | null: false, foreign_key: true |
| image                    | references | null: false, foreign_key: true |
| item_name                | text       | null: false                    |
| item_text                | text       | null: false                    |
| item_category            | text       | null: false                    |
| item_sales_status        | text       | null: false                    |
| item_shipping_fee_status | text       | null: false                    |
| item_prefecture          | text       | null: false                    |
| item_scheduled_delivery  | text       | null: false                    |
| item_price               | text       | null: false                    |

### Association
- belongs_to :user
- has_one_attached :image
- has_one :order, dependant: :destroy


## ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping, dependant: :destroy


## shippingsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| order              | references | null: false, foreign_key: true |
| postal_code        | text       | null: false                    |
| prececture         | text       | null: false                    |
| city               | text       | null: false                    |
| addresses          | text       | null: false                    |
| building           | text       |                                |
| phone_number       | text       | null: false                    |

### Association
- belongs_to :order