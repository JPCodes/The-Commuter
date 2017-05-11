class ConversationsController < ApplicationController
  before_action :require_authentication!, :except => [:index, :show]
  before_action :set_conversation, :only => [:show, :destroy, :edit, :update]
  def index
    @conversations = Conversation.all
  end

  def new
    @conversation = current_user.conversations.new
  end

  def create
    @conversation = current_user.conversations.new(conversation_params)
    if @conversation.save
      # Make Async
      redirect_to conversation_path(@conversation)
      flash[:success] = 'You\'ve Started a Conversation!'
    else
      render :new
    end
  end

  def edit
    # create a column for edited? == boolean, to show 'this post has been edited'
  end

  def update
    if @conversation.update(conversation_params)
      redirect_to conversation_path(@conversation)
      flash[:success] = 'Conversation successfully updated'
    else
      render :edit
    end
  end

  def show
    @response = Response.new
  end

  def destroy
    @conversation.destroy
    flash[:danger] = 'Conversation was successfully deleted'
    redirect_to conversations_path
  end

  private
  def conversation_params
    params.require(:conversation).permit(:title, :content)
  end

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end
end
