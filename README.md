# README

## users テーブル
 
| Column            | Type | Options      |
| ------------------| ---- | ------------ |
| nick_name         |string|null: false   |
| email             |string|null: false unique: true  |
| encrypted_password|string|null: false   |
| last_name         |string|null: false   |
| first_name        |string|null: false   |
| japanese_last_name  |string|null: false   |
| japanese_first_name |string|null: false   |
| birth_date        |date|null: false   |

### Association
- has_many :items
- has_many :purchase_records

## items テーブル
| Column                    | Type       | Options    |
| ------------------------- | ------------| ---------- |
| product_name              |string      |null: false |
| product_detail            |string      |null: false|
| category_id                |integer  |null: false|
|product_condition_id        |integer  |null: false|
|shipping_fee_id             |integer  |null: false|
|region_of_shipping_origin_id|integer  |null: false |
|estimated_delivery_date_id  |integer |null: false |
| price                     |integer     |null: false|
| user                      |references     |null: false  foreign_key: true|

### Association
- belongs_to :user
- has_one :purchase_record


## purchase records テーブル
| Column            | Type         | Options                       |
|-------------------|--------------|-------------------------------|
| user              |references    |null: false foreign_key:true                  |
| item              |references    |null: false foreign_key:true                  |

### Association
- belongs_to :item
- belongs_to :user
- has_one :customer


## customers テーブル
| Column                      | Type     | Options     |
|-----------------------------|----------|-------------|
| zip_code                    |string    |null: false  |
| region_of_shipping_origin_id|integer   |null: false  |
| city                        |string    |null: false  |
| street_address              |string     |null: false  |
| apartment_name              |string     |null: false  |
| tel                         |string     |null: false  |
|purchase_record              |reference  |null: false  foreign_key: true|

### Association
- belongs_to :purchase_record

