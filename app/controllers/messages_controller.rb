class MessagesController < ApplicationController
    def index
        @messages = Message.all
        @message = Message.new
    end

    def create
        @message = Message.new(message_params)
        @message.user_id = current_user.id

        @message.save
        ActionCable.server.broadcast("ChatroomChannel", render_to_string(partial: "message", locals: {message: @message}))
        head :ok
    end

    private

    def message_params
        params.require(:message).permit(:content)
    end
end
