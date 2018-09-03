class Message < ApplicationRecord
  belongs_to :connection
  belongs_to :user
  validates :body, presence: true, length: { in: 1..240 }

  def from?(some_user)
    user == some_user
  end
end
