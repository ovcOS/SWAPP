class ConnectionsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "connection_#{params[:connection_id]}"
  end
end
