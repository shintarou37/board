class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' }, { id: 2, name: 'Webデザイナー' }, { id: 3, name: 'フロントエンジニア' }, { id: 4, name: 'サーバーサイドエンジニア' },
    { id: 5, name: 'インフラエンジニア' }, { id: 6, name: 'データーベースエンジニア' }, { id: 6, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :users
  has_many :collects
end
