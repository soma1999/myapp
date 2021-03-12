# テーブル設定

## users テーブル

| Column               | Type         | Options     |
| ------               | ------       | ----------- |
| nickname             | string       | null: false |
| email                | string       | null: false, unique: true |
| encrypted_password   | string       | null: false |
| first_name           | string       | null: false |
| last_name            | string       | null: false |
| first_name_katakana  | string       | null: false |
| last_name_katakana   | string       | null: false |
| birthday             | date         | null: false |
| admin                | boolean      |



### Association

- has_many :rooms
- has_many :messages
- has_many :likes
- has_many :sns_credentials

## celebs テーブル

| Column          | Type   | Options     |
| ------          | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false,unique: true  |
| password_digest | string | null: false |
| description     | text   | null: false |

### Association

- has_many :rooms
- has_many :messages
 

## rooms テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| celeb    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :celeb
- has_many :messages
- has_one  :block
- has_many :orders
- has_one  :room
- has_one  :like

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | foreign_key: true              |
| celeb   | references | foreign_key: true              |
| room    | references | null: false, foreign_key: true |
| read    | boolean    | null: false                    |
| order   | boolean    | null: false                    |

### Association

- belongs_to :user
- belongs_to :room
- belongs_to :celeb


## blocks テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| room    | references | foreign_key: true              |

### Association

- belongs_to :room


## prices テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| content   |  string    | null: false                    |

### Association

- has_many :orders


## orders テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| price    | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association

- belongs_to :price
- belongs_to :room


## likes テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| room     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## sns_credentials

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| provider | string     | null: false                    |
| uid      | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
