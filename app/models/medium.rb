class Medium < ApplicationRecord
  belongs_to :user
  validates :file_type, :path, presence: true
  mount_uploader :path, PhotoUploader
end
