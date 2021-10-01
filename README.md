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
| birth_day          | date    | null: false               |


### Association
- has_many :items
- has_many :purchase_records



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| shipping_days_id    | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one   :purchase_records

## purchase_records テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :delivery_addresses
- belongs_to :item

## delivery_addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | text       | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | text       | null: false                    |
| address            | text       | null: false                    |
| building_name      | text       |                                |
| phone_number       | text       | null: false                    | 
| purchase_record    | references | null: false, foreign_key: true |
### Association
- belongs_to    :purchase_record

