class Collect < ApplicationRecord
  with_options presence: true do
    validates :explanation
    validates :language_id
    validates :type_id 
    validates :goal_id
    validates :framework_id
  end
end
