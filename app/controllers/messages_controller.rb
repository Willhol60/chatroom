# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.room = @room

    if @message.save
      ChatroomChannel.broadcast_to(@room, render_to_string(partial: 'message', locals: { message: @message }))
      head :ok
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def destroy
    message = Message.find(params[:id])
    message_id = message.id
    room = Room.find(params[:room_id])

    if message.destroy
      ChatroomChannel.broadcast_to(room, "delete-#{message_id}")
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
