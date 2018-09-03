class ConnectionsController < ApplicationController
  def index
    @connections = current_user.all_connections
  end

  def show
    @connection = Connection.find(params[:id])
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

  private

  def connection_params
    params.require(:connection).permit(:responder_id)
  end
end

