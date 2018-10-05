class ConversationsController < ApplicationController
  def new

  end

  def create
    @conversation = Conversation.new({user1: params[:conversation][:user], user2: 'You'})
    @conversation.save

    redirect_to @conversation
  end

  def show
    @conversation = Conversation.find(params[:id])
  end
end
