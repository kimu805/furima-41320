# アプリケーション名
furima（フリマ）  
https://furima-41320.onrender.com
## テスト用アカウント
・Basic認証ID：admin  
・Basic認証Password：2222  
### アカウント１
・名前：furima太郎  
・メールアドレス：furima@furima.com  
・パスワード：a1a1a1  
### アカウント２
・名前：furima四郎  
・メールアドレス：furima@shirou.com  
・パスワード：a1a1a1  
### PAYJPテストカード
・カード番号：4242424242424242  
・有効期限：今日より未来の日付  
・セキュリティコード：123
# 概要
１分で出品、１分で購入が完了するフリーマーケットアプリ。  
# 機能一覧
## ユーザー管理機能（devise）
・新規登録  
・ログイン  
・ログアウト  
## 商品管理機能
・一覧  
・出品（投稿）  
・編集  
・削除  
・詳細  
・検索（ransack）
## 商品購入機能
・購入  
決済機能：PAY.JP(API)  
# データベース設計
![image](https://github.com/user-attachments/assets/24cc8c49-beb3-4c8e-810d-760ce00662af)
# 使用技術
・フロントエンド  
HTML/CSS/JavaScript  

・バックエンド  
ruby 3.2.0  
Ruby on Rails 7.0.0  

・テスト  
RSpec  

・テキストエディタ  
VSCode  

・その他
バージョン管理・タスク管理：Git,GitHub  
ストレージサービス：AWS S3

<!-- # テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name_kanji    | string  | null: false |
| first_name_kanji   | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |


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
| prefecture_id       | integer    | null: false |
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
- has_one :delivery

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

- belongs_to :purchase -->
