class ConversationsController < ApplicationController
  def new
  end

  def create
    @conversation = Conversation.new({user1: 'Bill Gates', user2: params[:useranme]})
    @conversation.save

    redirect_to @conversation
  end

  def show
    @conversation = Conversation.find(params[:id])
  end
end
