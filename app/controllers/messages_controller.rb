class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.save

    redirect_to conversation_path(@conversation)
  end

  private
  def message_params
    params.require(:message).permit(:to, :from, :content)
  end
end
