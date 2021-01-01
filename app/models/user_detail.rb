class UserDetail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to :prefecture
  belongs_to :age
  belongs_to :language
  belongs_to :type
  belongs_to :goal
  validates :introduce, length: { maximum: 1000 }
  validates :GitHub, length: { maximum: 100 }
end
