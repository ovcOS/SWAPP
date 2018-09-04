class Tag < ApplicationRecord
  has_many :tag_skills
  has_many :tag_users
  has_many :skills, through: :tag_skills, dependent: :destroy
  has_many :users, through: :tag_users, dependent: :destroy

  validates :name, presence: true
end
