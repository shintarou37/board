class Collect < ApplicationRecord
  validates :explanation, presence: true
  validates :language_id, presence: true
end
