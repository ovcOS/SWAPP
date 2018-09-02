class ConnectionsController < ApplicationController
  def index
    @connections = Connection.where(:responder => current_user).or(Connection.where(:requester => current_user))
  end

  def show
  @connection = Connection.includes(:messages).find_by(id: params[:id])
  end

  def create
    @connection = Connection.new
    connection_params
    requester = params[:connection][:requester].to_i
    responder = params[:connection][:responder].to_i
    @connection.requester = User.find(requester)
    @connection.responder = User.find(responder)
    if @connection.save
      flash[:success] = 'Chat added!'
      redirect_to connections_path
    else
      render 'new'
    end
  end

  private

  def connection_params
    params.require(:connection).permit(:requester, :responder)
  end
end

