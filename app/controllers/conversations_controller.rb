class ConversationsController < ApplicationController
  def new
  end

  def create
    @conversation = Conversation.new({user1: 'Bill Gates', user2: params[:username]})
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
end
