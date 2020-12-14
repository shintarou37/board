# テーブル設計

## users テーブル
| Colum             | Type    | Options                   |
| --------          | ------  | ----------                |
| nickname          | string  | null: false               |
| GitHub            | text    |                           |
| introduce         | text    |                           |
| age_id            | integer |                           |
| prefectures_id    | integer |                           |
| language_id       | integer |                           |

### Association

- has_many :collects
- has_many :comments

## collects テーブル

| Column          | Type      | Options                        |
| ------          | ------    | -----------                    |
| explanation     | text      | null: false                    |
| language_id     | integer   | null: false                    |
| user            | references| null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user


## comments テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| text             | text       | null: false,                   |
### Association

- belongs_to :user
- belongs_to :collect
