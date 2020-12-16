# README

## usersテーブル

| Column            | Type       | Options     |
| ---------------   | ---------- | ----------- |
| nickname          | string     | null: false |
| email             | string     | null: false |
| encrypted_password| string     | null: false |
| last_name         | string     | null: false |
| first_name        | string     | null: false |
| first_name_kana   | string     | null: false |
| last_name_kana    | string     | null: false |
| birthday          | date       | null: false |

## Association
- 
- has_many   :items
  has_many   :buys
  has_many   :comments
  has_many   :favorites

## itemsテーブル

| Column               | Type       | Options                        |
| -----------------    | ---------- | ------------                   |
| name                 | string     | null: false                    |
| category_id          | integer    | null: false                    |
| price                | integer    | null: false                    |
| description          | string     | null: false                    |
| condition_id         | integer    | null: false                    |
| shipping_charges_id  | integer    | null: false                    |
| shipping_area_id     | integer    | null: false                    |
| shipping_days_id     | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

## Association
  has_one    :buy
- belongs_to :user
  has_many   :comments

## buysテーブル
| Column               | Type       | Options                        |
| -----------------    | ---------- | ------------                   |
| user_id              | references | null: false, foreign_key: true |
| items_id             | references | null: false, foreign_key: true |

## Association
 belongs_to :user
 belongs_to :item
 belongs_to :address

## addressesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| municipality      | string     | null: false                    |
| address           | string     | null: false                    |
| building          | string     |                                |
| phone             | string     | null: false                    |
| buy               | references | null: false, foreign_key: true |

## Association
  belongs_to :item

## commentsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| text              | text       | null: false                    |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

## Association
- belongs_to :user
  belongs_to :item

## favoritesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
