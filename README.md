# README

# アプリケーション名
my　present

# アプリケーション概要
招待状による、結婚式当日の出席確認
今までの思い出を画像投稿かつコメントで共有

# URL

# テスト用アカウント
メールアドレス: test@gmail.com
パスワード: a123456

# 利用方法
・新規登録にて、ユーザー登録
・ユーザー登録後、投稿するで写真とメッセージを投稿可能
・ログイン中投稿した画像は、コメント可能

# 目指した課題解決
 来年結婚する友人に向けて、
 結婚式をする際に悩んでいることを聞き出し、
 その中から
 ・当日の出席の確認
 ・出席者の食品アレルギーの整理
 ・今日までの写真集め
 以上の課題解決したく、
 なによりこのアプリ自体が友人に対して
 思い出になるプレゼントをしたいと思いました

 # 洗い出した要件
| 機能                | 目的      　　　　　　　     |
| ------------------ | -----------------------    |
| ユーザー登録機能      | 出席者の確認                 |
| 画像投稿機能         | ユーザーに画像提供しもらうため  |
| コメント機能         | ユーザー同士の当時の思い出共有  |


# 実装した機能についてのGIFと説明

# ローカルでの動作方法


# データベース設計

https://gyazo.com/a6f721eb091117d5cc8746122e531683

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



