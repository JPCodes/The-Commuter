class ResponsesController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @conversation = Conversation.find(params[:conversation_id])
    @response = @conversation.responses.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @response = @conversation.responses.new(response_params)
    if @response.save
      flash[:success] = 'Response Saved.'
      redirect_to conversation_path(@conversation)
    else
      flash[:failure] = 'Something went wrong.'
      redirect_to root_path
    end
  end

  private
  def response_params
    params.require(:response).permit(:content, :user_id)
  end
end
