## users

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | null: false, unique: true|
| encrypted_password | string   | null: false              |
| frist_name         | string   | null: false              |
| last_name          | string   | null: false              |
| kana_first_name    | string   | null: false              |
| kana_last_name     | string   | null: false              |
| birthday      　　　| date     | null: false              |


### Association
- has_many :items
- has_many :comments
- has_many :purchase_records

## items

| Column               | Type       | Options           |
| -------------------  | ---------- | ----------------- |
| product_name         | string     | null: false       |
| product_description  | text       | null: false       |
| category_id          | integer    | null: false       |
| product_condition_id | integer    | null: false       |
| pay_for_shipping_id  | integer    | null: false       |
| shipping_area_id     | integer    | null: false       |
| days_to_ship_id      | integer    | null: false       |
| price                | integer    | null: false       |
| user                 | references | foreign_key: true |


### Association
- belongs_to :user
- has_many :comments
- has_one :purchase_record

## purchase_records

| Column | Type       | Options           |
| ----   | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |


### Association
- belongs_to :item
- has_one :street_address
- belongs_to :user

## street_addresses

| Column           | Type       | Options           |
| ---------------  | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| shipping_area_id | integer    | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| phone_number     | string     | null: false       |
| purchase_record  | references | foreign_key: true |


### Association
- belongs_to :purchase_record

## comments

| Column | Type       | Options           |
| ----   | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item