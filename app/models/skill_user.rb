class SkillUser < ApplicationRecord
  belongs_to :skill
  belongs_to :user
end
