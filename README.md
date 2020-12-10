# テーブル設計

## users テーブル
| Colum             | Type    | Options                   |
| --------          | ------  | ----------                |
| nickname          | string  | null: false               |
| GitHub            | text    |                           |
| age               | integer |                           |
| introduce         | text    |                           |
| prefectures_id    | integer |                           |
| language_id       | integer |                           |

### Association

- has_many :collects
- has_many :tweets
- has_many :comments

## collects テーブル

| Column          | Type      | Options                           |
| ------          | ------    | -----------                       |
| explanation     | text      | null: false,                      |
| user            | references| null: false, foreign_key: true    |

### Association

- has_many :comments
- belongs_to :user

## tweets テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| explanation | text       | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| text             | text       | null: false,                   |
### Association

belongs_to :user
belongs_to :collect
belongs_to :tweet