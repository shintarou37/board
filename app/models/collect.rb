class Collect < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :comments
  has_many :likes

  belongs_to :user
  belongs_to :language
  belongs_to :type
  belongs_to :goal
  belongs_to :framework
  
  with_options presence: true do
    validates :explanation
    with_options numericality: { other_than: 1 } do
      validates :language_id
      validates :type_id 
      validates :goal_id
      validates :framework_id
    end
  end
end
