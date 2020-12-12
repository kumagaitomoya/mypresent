# mypresent

![トップ画面修正](https://user-images.githubusercontent.com/72239344/101884090-8595dd80-3bdb-11eb-8b70-593d433c1bb4.gif)

# デプロイ後の URL

http://18.176.197.8/

# アプリケーション概要

来年結婚する友人に向けて、
1 招待状にて結婚式出席の有無
2 新郎・新婦と参列同士の思い出の共有を
中心に実装したアプリケーションです。

# 使用言語と使用技術

・Ruby
・Ruby on Rails
・JavaScript
・HTML/CSS
・AWS(S3,EC2)
・Docker
・SQL
・Rspec
.Capistrano

# DEMO

【① 招待状（ユーザー）登録機能】
・出席の有無を招待状（ユーザー）登録として管理
・任意で当日の結婚式の食品アレルギーについても記述可能
![ログイン機能](https://user-images.githubusercontent.com/72239344/101976444-9fd9c500-3c88-11eb-8627-b1feae2dfb5b.gif)

【② 画像、メッセージ投稿機能】
・招待状登録者が画像、メッセージ投稿可能
・選択した画像はプレビュー機能実装
・投稿後はトップページにて、一覧表示される
![投稿画面](https://user-images.githubusercontent.com/72239344/101976590-014e6380-3c8a-11eb-9db5-8d1806a26b9f.gif)

【③ 追加メッセージ（コメント）機能】
・ログインしていれば、投稿画像にコメント可能
・コメントは非同期チャット機能にて実装
![コメント](https://user-images.githubusercontent.com/72239344/101976676-0c55c380-3c8b-11eb-9c4c-fd39cde6d18b.gif)

# 機能一覧

【① 招待状（ユーザー）登録機能】
・ログイン機能（devise）

【② 画像、メッセージ投稿機能】
・画像プレビュー機能（Javascript）
・画像投稿一覧表示と詳細表示、
・画像投稿の編集と削除機能

【③ 追加メッセージ（コメント）機能】
・非同期チャット機能（json,ActionCable）

【その他】
・rails 構文規約チェックツール（Rubocop）
・テストデータ投入（Faker）
・テストの実施(RSpec)

# テスト用アカウント

メールアドレス: test@gmail.com
パスワード: a123456

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

| 機能             | 目的 　　　　　　　                            |
| ---------------- | ---------------------------------------------- |
| ユーザー管理機能 | devise を利用したユーザー登録を実装            |
| 画像投稿機能     | ユーザーが画像投稿できるように実装             |
| 一覧表示機能     | 投稿された画像が一覧で表示できるようにする     |
| 詳細表示機能     | 投稿された画像の詳細情報を表示できるようにする |
| 画像編集機能     | 投稿した画像を編集できるように実装             |
| 画像削除機能     | 投稿した画像を削除できるように実装             |
| コメント機能     | コメント機能できるように実装                   |

# 実装した機能についての GIF と説明

# ローカルでの動作方法

# データベース設計

## user テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| attendance_id      | integer | null: false              |
| name               | string  | null: false              |
| encrypted_password | string  | null: false              |
| email              | string  | null: false unique: true |
| postal_code        | string  | null: false              |
| prefecture_id      | integer | null: false              |
| municipality       | string  | null: false              |
| address            | string  | null: false              |
| building_name      | string  |                          |
| allergy            | string  |                          |

## Association

- has_many : messages
- has_many : comments

## message テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| user          | references | null: false,foreign_key: true |
| photo_name    | string     | null: false                   |
| photo_message | text       | null: false                   |

# Association

- belongs_to :user
- has_many : comments

## comment テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| text 　　　　　 | text       | null: false                   |
| user            | references | null: false,foreign_key: true |
| message         | references | null: false,foreign_key: true |

# Association

- belongs_to :user
- belongs_to :message
