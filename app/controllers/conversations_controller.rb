class ConversationsController < ApplicationController
  def new
  end

  def create
    @conversation = Conversation.new({user1: '???', user2: params[:username]})
    @conversation.save

    redirect_to @conversation
  end

  def show
    @conversation = Conversation.friendly.find(params[:id])
  end

  def index
    @conversations = Conversation.all
  end

  def display_elements
    @conversation = Conversation.friendly.find(params[:conversation_id])
    if @conversation[:display_html?]
      @conversation[:display_html?] = false
    else
      @conversation[:display_html?] = true
    end
    @conversation.save
    redirect_to @conversation
  end

  def clear_history
    @conversation = Conversation.friendly.find(params[:conversation_id])
    @conversation.messages.delete_all
    redirect_to @conversation
  end

  def messages_as_json
    @conversation = Conversation.friendly.find(params[:conversation_id])
    output_hash = {}
    output_hash['display_html?'] = @conversation[:display_html?]
    messages_array = []
    @conversation.messages.each do |message|
      message_hash = {}
      message_hash['to'] = message.to
      message_hash['from'] = message.from
      message_hash['content'] = message.content
      message_hash['created_at'] = message.created_at
      messages_array.push message_hash
    end
    output_hash['messages'] = messages_array
    render :json => output_hash
  end
end
