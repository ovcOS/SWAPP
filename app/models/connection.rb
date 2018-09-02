class Connection < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :requester, class_name: 'User', foreign_key: :user_id
  belongs_to :responder, class_name: 'User', foreign_key: :responder_id
end
