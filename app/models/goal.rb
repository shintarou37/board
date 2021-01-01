class Goal < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' }, { id: 2, name: 'Webアプリ開発' }, { id: 3, name: 'スマホアプリ開発' }, { id: 4, name: 'AI（人工知能）開発' },
    { id: 5, name: 'ゲーム開発' }, { id: 6, name: 'システム開発' }, { id: 7, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :user_details
  has_many :collects
end
