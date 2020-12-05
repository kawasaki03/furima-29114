# README

# テーブル設計

## usersテーブル
| Culumn   | Type   |   Options   |
| -------- | ------ | ----------- |
| nickname | string | null: false,unique: true |
| email    | string | null: false,unique: true |
| encrypted_password | string | null: false |
| last_name| string | null: false |
|first_name| string | null: false |
|last_name_kana| string | null: false |
|first_name_kana| string| null: false |
| birthday |  date  |  null: false |


### Association
 - has_many :items
 - has_many :purchase_records
 - has_many :comments


## itemsテーブル
|  Culumn   | Type   |    Options    |
| --------- | ------ | ------------- |
| item_name | string |  null: false  |
|description|  text  |  null: false  |
|   price   |integer |  null: false  |
| category_id  | integer |  null: false  |
| condition_id | integer |  null: false  |
|shipping_charge_id| integer |  null: false  |
|  area_id  | integer |  null: false  |
|delivery_time_id| integer |  null: false  |
|   user    | references | null: false,foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase_record
- has_many :comments


## commentsテーブル
| Culumn   |   Type     | Options  |
| -------  |  --------- | -------- |
|   user   |references  | null: false,foreign_key: true |
|   item   | references | null: false,foreign_key: true |
|   text   | text       | null: false |

### Association
- belongs_to :user
- belongs_to :item




## purchase_recordsテーブル
| Culumn   |    Type    | Options   |
| -------- | ---------- | --------- |
|   user   | references | null: false,foreign_key: true |
|   item   | references | null: false,foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
|   Culumn    | Type   |   Options   |
| ----------- | ------ | ----------- |
| postal_code | string | null: false |
|   state_id  | integer| null: false |
|    city     | string | null: false |
|house_number | string | null: false |
|building_name| string |             |
|phone_number | string | null: false |
| purchase_record| references | null: false,foreign_key: true |

### Association
- belongs_to :purchase_record





This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
