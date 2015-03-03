class ResponsesController < ApplicationController
  def index
    # @responses = Response.all
    @q = Response.search(params[:q])
    @responses = @q.result(distinct: true)
  end
  
  def show
    @response = Response.find(params[:id])
    @user = current_user
  end
  
  def new
    @response = Response.new
  end
  
  def create
    @response = Response.new(response_params)
    
    if @response.save
      flash[:success] = "Your response was successfully created."
      redirect_to @response
    else
      render 'new'
    end
  end
  
  private
  
    def response_params
      params.require(:response).permit(:contents, :inquiry_id, :user_id)
    end
end