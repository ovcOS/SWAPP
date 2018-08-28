class Skill < ApplicationRecord
  has_many :tag_skills
  has_many :skill_users
  has_many :users, through: :skill_users
  has_many :tags, through: :tag_skills

  validates :name, presence: true
end
