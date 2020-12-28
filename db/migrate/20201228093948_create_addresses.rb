class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code ,null: false
      t.integer :prefecture_id ,null: false
      t.string :municipality ,null: false
      t.string :address ,null: false
      t.string :building
      t.string :phone ,null: false
      t.references :buy ,null: false, foreign_key: true
      t.timestamps
    end
  end
end

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