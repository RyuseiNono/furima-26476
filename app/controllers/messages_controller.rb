class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    ActionCable.server.broadcast 'message_channel', content: { message: @message, user: @message.user } if @message.save
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
