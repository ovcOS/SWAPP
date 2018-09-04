class Skill < ApplicationRecord
  has_many :tag_skills
  has_many :skill_users
  has_many :users, through: :skill_users, dependent: :destroy
  has_many :tags, through: :tag_skills, dependent: :destroy

  validates :name, presence: true
end
