class Message < ApplicationRecord
  belongs_to :connection
  belongs_to :user
  validates :body, presence: true, length: { in: 1..240 }
  after_create :broadcast_message

  def broadcast_message
    ActionCable.server.broadcast("connection_#{connection.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/message",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
  end
end
