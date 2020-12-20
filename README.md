# テーブル設計

## users テーブル
| Colum             | Type    | Options                   |
| --------          | ------  | ----------                |
| nickname          | string  | null: false               |
| GitHub            | text    |                           |
| introduce         | text    |                           |
| prefecture_id     | integer | null: false               |
| age_id            | integer |                           |
| language_id       | integer |                           |
| type_id           | integer |                           |
| goal_id           | integer |                           |

### Association

- has_many :collects
- has_many :comments
- has_many :likes

## collects テーブル

| Column          | Type      | Options                        |
| ------          | ------    | -----------                    |
| explanation     | text      | null: false                    |
| language_id     | integer   | null: false                    |
| type_id         | integer   | null: false                    |
| goal_id         | integer   | null: false                    |
| framework_id    | integer   | null: false                    |
| user            | references| null: false, foreign_key: true |

### Association

- has_many :comments
- has_many :likes
- belongs_to :user


## comments テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| text             | text       | null: false,                   |
| user             | references | null: false, foreign_key: true |
| collect          | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :collect
## likes テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| collect          | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :collect
