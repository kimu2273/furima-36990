## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birth_day          | integer | null: false               |


### Association
- has_many :items
- has_many :purchase_records
- has_one  :delivery_addresses
- belongs_to_active_hash :birth_day

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category           | integer    | null: false                    |
| condition          | integer    | null: false                    |
| shipping_charges   | integer    | null: false                    |
| shipping_days      | integer    | null: false                    |
| shipping_area      | integer    | null: false                    |
| price              | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_charges
- belongs_to_active_hash :shipping_days 
- belongs_to_active_hash :shipping_area

## purchase_records テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| delivery_address   | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :delivery_addresses

## delivery_addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | text       | null: false                    |
| prefecture         | integer    | null: false                    |
| city               | text       | null: false                    |
| address            | text       | null: false                    |
| building_name      | text       | null: false                    |
| phone_number       | text       | null: false                    | 
| user               | references | null: false, foreign_key: true |
### Association
- belongs_to :users
- has_one    :purchase_records

