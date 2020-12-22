class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :collects
  has_one :user_detail
  has_one_attached :image
  
  
  with_options presence: true do
    validates :nickname
    # validates :prefecture_id
  end
  # with_options numericality: { other_than: 1 } do
  #   validates :prefecture_id
  #   validates :age_id
  #   validates :language_id
  #   validates :type_id
  #   validates :goal_id
  # end
end
