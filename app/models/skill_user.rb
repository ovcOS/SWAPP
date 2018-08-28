class SkillUser < ApplicationRecord
  belongs_to :skill
  belongs_to :user

  validates_uniqueness_of :skill_id, :scope => :user_id
end
