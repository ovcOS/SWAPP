class TagUser < ApplicationRecord
  belongs_to :tag
  belongs_to :user

  validates_uniqueness_of :tag_id, :scope => :user_id
end
