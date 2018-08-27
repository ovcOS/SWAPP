class Medium < ApplicationRecord
  belongs_to :user

  validates :type, :url, presence: true
end
