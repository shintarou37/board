class Collect < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :comments, dependent: :destroy
  has_many :users

  belongs_to :user
  belongs_to :language
  belongs_to :type
  belongs_to :goal
  belongs_to :framework
  
  validates :explanation,length: { maximum: 1000 },presence: true
  with_options numericality: { other_than: 1 } do
    validates :language_id
    validates :type_id 
    validates :goal_id
    validates :framework_id
  end
end
