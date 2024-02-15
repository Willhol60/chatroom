# frozen_string_literal: true

class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id

    if @message.save
      ActionCable.server.broadcast(ChatroomChannel.to_s,
                                   render_to_string(partial: 'message', locals: { message: @message }))
      head :ok
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
