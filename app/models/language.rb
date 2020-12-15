class Language < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' }, { id: 2, name: 'PHP' }, { id: 3, name: 'JavaScript' }, { id: 4, name: 'Python' },
    { id: 5, name: 'GO' }, { id: 6, name: 'Kotlin' }, { id: 7, name: 'Java' },
    { id: 8, name: 'Swift' }, { id: 9, name: 'C#' }, { id: 10, name: 'C++' },
    { id: 11, name: 'R' }, { id: 12, name: 'Photoshop' }, { id: 13, name: 'Illustrator' },
    { id: 14, name: 'Dreamweaver' }, { id: 15, name: 'WordPress' }, { id: 16, name: 'HTML,CSS' },
    { id: 17, name: 'AWS' }, { id: 18, name: 'LinuxOS' }, { id: 19, name: 'WindowsOS' },
    { id: 20, name: 'Oracle Database' }, { id: 21, name: 'MySQL' }, { id: 22, name: 'PostgreSQL' },
    { id: 23, name: 'SQLite' }, { id: 24, name: 'Microsoft SQL Server' }, { id: 25, name: 'Microsoft Access' },
    { id: 26, name: 'FileMaker' }, { id: 27, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :users
  has_many :collects
end
