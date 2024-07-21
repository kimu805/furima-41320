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

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user             | references | null: false, foreign_key: true|
| name             | string     | null: false |
| description      | text       | null: false |
| category         | integer    | null: false |
| condition        | integer    | null: false |
| shipping_pay     | integer    | null: false |
| shipping_origin  | integer    | null: false |
| shipping_time    | integer    | null: false |
| price            | string     | null: false |
| commission       | string     | null: false |
| profit           | integer    | null: false |

### Association

- belongs_to :user
- has_one :purchase
- has_one_attached :image

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| delivery | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :delivery

## deliveries テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| post_code  | integer    | null: false |
| prefecture | integer    | null: false |
| municipal  | string     | null: false |
| street     | string     | null: false |
| building   | string     | null: false |
| call       | integer    | null: false |

### Association

- has_many :purchases