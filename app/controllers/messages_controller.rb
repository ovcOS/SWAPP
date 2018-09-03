class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @connection = Connection.find(params[:message]["connection_id"].to_i)
    @message.connection = @connection
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast("connection_#{@connection.id}", { message_partial: render(partial: "messages/message", locals: { message: @message })
      })
      respond_to do |format|
        format.html { redirect_to connection_path(@connection) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "connection/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
