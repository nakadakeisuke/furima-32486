# README

## usersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| nickname        | string     | null: false, foreign_key: true |
| email           | string     | null: false, foreign_key: true |
| password        | string     | null: false, foreign_key: true |
| last_name       | string     | null: false, foreign_key: true |
| first_name      | string     | null: false, foreign_key: true |
| last_name_kana  | string     | null: false, foreign_key: true |
| birthday_year   | integer    | null: false, foreign_key: true |
| birthday_month  | integer    | null: false, foreign_key: true |
| birthday_day    | integer    | null: false, foreign_key: true |

## Association
- belongs_to :favorite
- belongs_to :item
  belongs_to :comment
  belongs_to :buy
  belongs_to :card

## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| items_name        | string     | null: false, foreign_key: true |
| category          | string     | null: false, foreign_key: true |
| price             | integer    | null: false, foreign_key: true |
| description_items | string     | null: false, foreign_key: true |
| items_condition   | string     | null: false, foreign_key: true |
| shipping_charges  | string     | null: false, foreign_key: true |
| shipping_area     | string     | null: false, foreign_key: true |
| shipping_days     | integer    | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

## Association
- has_one    :buy
- has_many   :users
  belongs_to :comment

## buysテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | integer    | null: false, foreign_key: true |
| prefecture        | string     | null: false, foreign_key: true |
| municipality      | string     | null: false, foreign_key: true |
| address           | string     | null: false, foreign_key: true |
| phone             | integer    | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

## Association
- has_many   :users
- has_one    :buy
  belongs_to :item

## cardテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| number            | integer    | null: false, foreign_key: true |
| expiration        | integer    | null: false, foreign_key: true |
| security          | string     | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |
| buy               | references | null: false, foreign_key: true |

## Association
- has_many   :users
- belongs_to :buy

## commentsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| text              | text       | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

## Association
- has_many   :users
- has_many   :items

## favoritesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

## Association
- has_many   :users
- has_many   :items
