## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| password           | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birth_date         | string     | null: false                    |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| name                | text       | null: false                    |
| text                | text       | null: false                    |
| category            | integer    | null: false                    |
| sales_status        | integer    | null: false                    |
| shipping_fee_status | integer    | null: false                    |
| prefecture          | integer    | null: false                    |
| scheduled_delivery  | integer    | null: false                    |
| price               | integer    | null: false                    |

### Association
- belongs_to :user
- has_one_attached :image
- has_one :order


## ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippingsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| order              | references | null: false, foreign_key: true |
| postal_code        | string     | null: false                    |
| prefecture         | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |

### Association
- belongs_to :order