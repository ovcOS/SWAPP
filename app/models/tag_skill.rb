class TagSkill < ApplicationRecord
  belongs_to :tag
  belongs_to :skill

  validates_uniqueness_of :tag_id, :scope => :skill_id
end
