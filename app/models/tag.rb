class Tag < ApplicationRecord
  has_many :skills, through: :tag_skills
  has_many :users, through: :tag_users

  validates :name, presence: true
end
