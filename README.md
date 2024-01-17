# README

いったい多の関係にあるものは、多のほうに外部キーが与えられる
## users テーブル

| Column            | Type | Options      |
| ------------------| ---- | ------------ |
| nick name         |string|Null: false   |
| mail address      |string|unique: true  |
| password          |string|Null: false   |
| encrypted_password|string|Null: false  |


## items テーブル
| Column        | Type   | Options    |
| ------------- | ------ | ---------- |
| product name  |string  |Null: false|
| price         |string  |Null: false|
| item supplier |string  |Null: false|
| user          |string  |Null: false  foreign_key: true|


## purchase record テーブル
| Column            | Type     | Options                       |
|-------------------|----------|-------------------------------|
| customer          |string    |Null: false                    |
| purchased item    |string    |Null: false                    |
| user              |string    |Null: false  foreign_key: true|


## customer テーブル
| Column            | Type     | Options     |
|-------------------|----------|-------------|
| zip code          |string    |Null: false  |
| prefecture        |string    |Null: false  |
| city              |string    |Null: false  |
| street address    |text      |Null: false  |
| tel               |text      |Null: false  |
