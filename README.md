# README

## usersテーブル

| Column            | Type       | Options     |
| ---------------   | ---------- | ----------- |
| nickname          | string     | null: false |
| email             | string     | null: false |
| encrypted_password| string     | null: false |
| last_name         | string     | null: false |
| first_name        | string     | null: false |
| last_name_kana    | string     | null: false |
| birthday          | date       | null: false |

## Association
- belongs_to :favorite
- belongs_to :item
  belongs_to :comment
  belongs_to :buy
  belongs_to :card

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
- has_one    :buy
- has_many   :users
  belongs_to :comment

## buysテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | integer    | null: false                    |
| prefecture        | string     | null: false                    |
| municipality      | string     | null: false                    |
| address           | string     | null: false                    |
| phone             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

## Association
- has_many   :users
- has_one    :buy
  belongs_to :item

## cardテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| number            | integer    | null: false                    |
| expiration        | integer    | null: false                    |
| security          | string     | null: false                    |
| user              | references | null: false, foreign_key: true |
| buy               | references | null: false, foreign_key: true |

## Association
- has_many   :users
- belongs_to :buy

## commentsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| text              | text       | null: false                    |
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
