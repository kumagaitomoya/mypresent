# README

# テーブル設計

## user テーブル

| Column             | Type     |Options                   |
| ---------------    | -------- |-----------------------   |
| attendance_id      | integer  | null: false              |
| name               | string   | null: false              |
| encrypted_password | string   | null: false              |
| email              | string   | null: false unique: true |
| postal_code        | string   | null: false              |
| prefecture_id      | integer  | null: false              |
| municipality       | string   | null: false              |
| address            | string   | null: false              |
| building_name      | string   |                          |
| allergy            | string   |                          |
　
## Association

- has_many : messages
- has_many : comments


## message テーブル
| Column              | Type       | Options                       |
| ----------------    | ---------- | ----------------------------- |
| user                | references | null: false,foreign_key: true |
| photo_name          | string     | null: false                   |
| photo_message       | text       | null: false                   |

# Association
- belongs_to :user
- has_many : comments

## comment テーブル
| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------  |
| text       　　　　　 | text       | null: false                   |
| user                | references | null: false,foreign_key: true |
| message             | references | null: false,foreign_key: true |

# Association
- belongs_to :user 
- belongs_to :message

