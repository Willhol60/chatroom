class MessagesController < ApplicationController
    def index
        @messages = Message.all
        @message = Message.new
    end

    def create
        @message = Message.new(message_params)
        @message.user_id = current_user.id

        if @message.save
            redirect_to root_path
        else
            render "messages/index", status: :unprocessable_entity
        end
    end

    private

    def message_params
        params.require(:message).permit(:content)
    end
end