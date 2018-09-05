class ConnectionsController < ApplicationController
  include ActionView::Helpers::DateHelper

  def index
    @connections = current_user.all_connections
  end

  def show
    @connection = Connection.includes(messages: :user).find(params[:id])
    @user = @connection.requester == current_user ? @connection.responder : @connection.requester
    @message = Message.new
  end

  def create
    @connection = Connection.new
    @connection.requester = current_user
    @connection.responder = User.find(connection_params[:responder_id].to_i)
    if @connection.save
      redirect_to connection_path(@connection)
    else
      render 'new'
    end
  end

  def destroy
    @connection = Connection.find(params[:id])
    @connection.destroy

    respond_to do |format|
      format.html {redirect_to connections_path}
      format.js
    end
  end

  private

  def connection_params
    params.require(:connection).permit(:responder_id)
  end
end

