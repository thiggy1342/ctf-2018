class MessagesController < ApplicationController
  http_basic_authenticate_with name: "BigBillyMoneyBags", password: "21b341bf77e44006eeaecf446d4646c546d399792951b989a572ee6dc3240333",
                                 only: [:show]

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.create(message_params)

    redirect_to conversation_path(@conversation)
  end

  def show
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.find(params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:to, :from, :content)
  end
end
