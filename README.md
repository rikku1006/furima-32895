## users

| Column          | Type    | Options     |
| --------------- | --------| ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| frist_name      | string  | null: false |
| last_name       | string  | null: false |
| kana_first_name | string  | null: false |
| kana_last_name  | string  | null: false |
| birthday_year   | integer | null: false |
| birthday_month  | integer | null: false |
| birthday_day    | integer | null: false |


### Association
- has_many :items
- has_many :comments
- has_many :purchase_records

## items

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| product_name        | string     | null: false       |
| product_description | text       | null: false       |
| category            | integer    | null: false       |
| product_condition   | integer    | null: false       |
| pay_for_shipping    | integer    | null: false       |
| shipping_area       | integer    | null: false       |
| days_to_ship        | integer    | null: false       |
| price               | integer    | null: false       |
| user                | references | foreign_key: true |


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

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| postal_code     | integer    | null: false       |
| prefect_tures   | integer    | null: false       |
| municipality    | text       | null: false       |
| address         | text       | null: false       |
| building_name   | text       |                   |
| phone_number    | integer    | null: false       |
| purchase_record | references | foreign_key: true |


### Association
- belongs_to :purchase record

## comments

| Column | Type       | Options           |
| ----   | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item