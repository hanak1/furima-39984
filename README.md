# README
|             |  |       |

## users テーブル

| Column            | Type | Options      |
| ------------------| ---- | ------------ |
| nick_name         |string|null: false   |
| mail_address      |string|unique: true  |
| password          |string|null: false   |
| encrypted_password|string|null: false   |
| last_name         |string|null: false   |
| first_name        |string|null: false   |
| birth_date        |string|null: false   |

## items テーブル
| Column                    | Type   | Options    |
| ------------------------- | ------ | ---------- |
| picture                   |string  |null: false |
| product_name              |string  |null: false |
| product_detail            |string  |null: false|
| category                  |string  |null: false|
|product_condition          |string  |null: false|
|shipping_fee               |string  |null: false|
|region_of_shipping_origin  |string  |null: false |
|estimated delivery date    |string  |null: false |
| price                     |string  |null: false|
| item_supplier             |string  |null: false|
| user                      |string  |null: false  foreign_key: true|


## purchase records テーブル
| Column            | Type     | Options                       |
|-------------------|----------|-------------------------------|
| customer          |string    |null: false  foreign_key: true                  |
| purchased_item    |string    |null: false  foreign_key: true                  |
※外部キーどちらも

## customers テーブル
| Column            | Type     | Options     |
|-------------------|----------|-------------|
| zip_code          |string    |null: false  |
| prefecture        |string    |null: false  |
| city              |string    |null: false  |
| street_address    |string     |null: false  |
| tel               |string     |null: false  |
