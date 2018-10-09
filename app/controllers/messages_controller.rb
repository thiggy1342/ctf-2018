class MessagesController < ApplicationController
  http_basic_authenticate_with name: "BigBillyMoneyBags", password: "21b341bf77e44006eeaecf446d4646c546d399792951b989a572ee6dc3240333",
                                 only: [:show]

  def create
    @conversation = Conversation.friendly.find(params[:conversation_id])
    @message = @conversation.messages.create(message_params)

    # writes flat file for selenium script to read later
    if @message[:user_generated]
      f = File.new("cache/messages/c_#{@conversation[:hash_id]}_m_#{@message[:id]}.txt", "w")
      f.write "/conversations/#{@conversation[:hash_id]}/messages/#{@message[:id]}"
      f.close
    end

    redirect_to @conversation
  end

  def show
    @conversation = Conversation.friendly.find(params[:conversation_id])
    @message = Message.find(params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:to, :from, :content, :user_generated)
  end
end
