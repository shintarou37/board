class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' }, { id: 2, name: '15才' }, { id: 3, name: '16才' }, { id: 4, name: '17才' },
    { id: 5, name: '18才' }, { id: 6, name: '19才' }, { id: 7, name: '20才' },
    { id: 8, name: '21才' }, { id: 9, name: '22才' }, { id: 10, name: '23才' },
    { id: 11, name: '24才' }, { id: 12, name: '25才' }, { id: 13, name: '26才' },
    { id: 14, name: '27才' }, { id: 15, name: '28才' }, { id: 16, name: '29才' },
    { id: 17, name: '30才' }, { id: 18, name: '31才' }, { id: 19, name: '32才' },
    { id: 20, name: '33才' }, { id: 21, name: '34才' }, { id: 22, name: '35才' },
    { id: 23, name: '36才' }, { id: 24, name: '37才' }, { id: 25, name: '38才' },
    { id: 26, name: '39才' }, { id: 27, name: '40才' }, { id: 28, name: '41才' },
    { id: 29, name: '42才' }, { id: 30, name: '43才' }, { id: 31, name: '44才' },
    { id: 32, name: '45才' }, { id: 33, name: '46才' }, { id: 34, name: '47才' },
    { id: 35, name: '48才' }, { id: 36, name: '49才' }, { id: 37, name: '50才' },
    { id: 38, name: '51才' }, { id: 39, name: '52才' }, { id: 40, name: '53才' },
    { id: 41, name: '54才' }, { id: 42, name: '55才' }, { id: 43, name: '56才' },
    { id: 44, name: '57才' }, { id: 45, name: '58才' }, { id: 46, name: '59才' },
    { id: 47, name: '60才' }
  ]
  include ActiveHash::Associations
  has_many :users
end
