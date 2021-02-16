# テーブル設定

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false |
| email    | string | null: false,unique: true |
| encrypted_password | string | null: false |
| birthday | date   | null: false |


### Association

- has_many :celebs, through: rooms
- has_many :rooms
- has_many :message_users

## celebs テーブル

| Column      | Type   | Options     |
| ------      | ------ | ----------- |
| name        | string | null: false |
| email       | string | null: false |
| password_digest    | string | null: false |
| description | text | null: false |

### Association

- has_many :users, through: rooms
- has_many :rooms
- has_many :message_celebs

## rooms テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| celeb   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :celeb
- has_many :message_celebs
- has_many :message_users

## message_users テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## message_celebs テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null:false                     |
| celeb   | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :celeb
- belongs_to :message