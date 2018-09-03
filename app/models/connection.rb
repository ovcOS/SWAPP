class Connection < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :requester, class_name: 'User', foreign_key: :requester_id
  belongs_to :responder, class_name: 'User', foreign_key: :responder_id

  validates_uniqueness_of :requester_id, :scope => :responder_id

  scope :between, -> (requester_id, responder_id) do
    where(requester_id: requester_id, responder_id: responder_id).or(
      where(requester_id: responder_id, responder_id: requester_id)
    )
  end
end

