# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| user                | references | null: false, foreign_key: true|
| name                | string     | null: false |
| description         | text       | null: false |
| category_id         | integer    | null: false |
| condition_id        | integer    | null: false |
| shipping_pay_id     | integer    | null: false |
| shipping_origin_id  | integer    | null: false |
| shipping_time_id    | integer    | null: false |
| price               | integer    | null: false |


### Association

- belongs_to :user
- has_one :purchase
- has_one_attached :image

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :delivery

## deliveries テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| post_code     | string     | null: false |
| prefecture_id | integer    | null: false |
| municipal     | string     | null: false |
| street        | string     | null: false |
| building      | string     |
| call          | string     | null: false |
| purchase      | references | null: false, foreign_key: true |



### Association

- has_many :purchases