class Framework < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' }, { id: 2, name: 'Ruby on Rails' }, { id: 3, name: 'Sinatra' }, { id: 4, name: 'Padrino' },
    { id: 5, name: 'Laravel' }, { id: 6, name: 'CakePHP' }, { id: 7, name: 'FuelPHP' },
    { id: 8, name: 'Spring Framework' }, { id: 9, name: 'Play Framework' }, { id: 10, name: 'JSF' },
    { id: 11, name: 'AngularJS' }, { id: 12, name: 'Vue.js' }, { id: 13, name: 'React' },
    { id: 14, name: 'Bootstrap' }, { id: 15, name: 'Foundation' }, { id: 16, name: 'UIkit' },
    { id: 17, name: 'その他、特になし' }
  ]
  include ActiveHash::Associations
  has_many :collects
end
