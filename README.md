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
- has_many :orders



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
- has_one   :order

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :delivery_addresses
- belongs_to :item

## delivery_addresses テーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| post_code          | string      | null: false                     |
| shipping_area_id    | integer    | null: false,  foreign_key: true |
| city               | string      | null: false                     |
| address            | string      | null: false                     |
| building_name      | string      |                                 |
| phone_number       | string      | null: false                     | 
| order              | references  | null: false, foreign_key: true  |
### Association
- belongs_to    :order

