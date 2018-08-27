class Connection < ApplicationRecord
  has_many :messages
  belongs_to :requester, class_name: 'User', foreign_key: :requester_id
  belongs_to :responder, class_name: 'User', foreign_key: :responder_id

  validates :request, length: { minimum: 1, maximum: 160 }
end
