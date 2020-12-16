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
  has_many   :address
  has_many   :cards
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
- has_one    :address
- belongs_to :user
  has_many   :comments

## buyテーブル
| Column               | Type       | Options                        |
| -----------------    | ---------- | ------------                   |
| user_id              | string     | null: false                    |
| items_id             | integer    | null: false                    |

## Association
 belongs_to :user
 has_one    :item

## addressテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                     |
| prefecture        | string     | null: false                    |
| municipality      | string     | null: false                    |
| address           | string     | null: false                    |
| building          | string     | null: false                   |
| phone             | string    | null: false                     |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one    :address
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
- belongs_to :user
- belongs_to :address

## commentsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| text              | text       | null: false                    |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item

## favoritesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
