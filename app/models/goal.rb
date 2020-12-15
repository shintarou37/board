class Goal < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' }, { id: 2, name: 'WEBデザイナー' }, { id: 3, name: 'フロントエンドエンジニア' }, { id: 4, name: 'サーバーサイドエンジニア' },
    { id: 5, name: 'インフラエンジニア' }, { id: 6, name: 'データーベースエンジニア' }, { id: 7, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :users
  
end
