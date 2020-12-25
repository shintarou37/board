#アプリケーション名 
チーム開発エンジニア募集アプリ

#機能一覧
掲示板投稿機能(非同期通信)
コメント投稿機能(非同期通信)
検索機能
ユーザー登録機能

#URL
http://3.131.108.243/

#テスト用アカウント
メールアドレス  a@a
パスワード  aaaaaa

#利用方法
１.上記テスト用アカウントでログイン(ログインはヘッダーにございます)
２.投稿機能で内容を入力して投稿
３.自分の投稿以外の機能の詳細ボタンを押して、コメントする
４.一度投稿一覧画面に戻り、検索する

#目指した課題解決	
現在、市場に未経験でもエンジニアに挑戦したいという人が増えています。
その中で、一人で勉強が続かない、誰かと一緒に開発したいという悩みが出てくると感じました。
そこで、その悩みを解決するべくしてこのアプリケーションを作成しました。

# テーブル設計

## users テーブル
| Colum             | Type    | Options                   |
| --------          | ------  | ----------                |
| nickname          | string  | null: false               |

### Association

- has_many :collects
- has_many :comments
- has_one :user_detail

## user_detail テーブル
| Colum             | Type    | Options                   |
| --------          | ------  | ----------                |
| GitHub            | text    |                           |
| introduce         | text    |                           |
| prefecture_id     | integer | null: false               |
| age_id            | integer |                           |
| language_id       | integer |                           |
| type_id           | integer |                           |
| goal_id           | integer |                           |

### Association

- belongs_to :user

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


## comments テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| text             | text       | null: false,                   |
| user             | references | null: false, foreign_key: true |
| collect          | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :collect