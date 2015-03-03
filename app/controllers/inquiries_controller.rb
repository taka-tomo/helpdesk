class InquiriesController < ApplicationController
  def index
    # @inquiries = Inquiry.all
    @q = Inquiry.search(params[:q])
    @inquiries = @q.result(distinct: true)
  end
  
  def new
    @inquiry = Inquiry.new
    @user = current_user
    @init_status = Status.find_by_name("unresolved")
  end
  
  def show
    @inquiry = Inquiry.find(params[:id])
    @user = current_user
    # @responses = @inquiry.responses.all
    @q = @inquiry.responses.search(params[:q])
    @responses = @q.result(distinct: true)
    @response = @inquiry.responses.build
    @unresolved_status = Status.find_by_name("unresolved")
    @resolved_status = Status.find_by_name("resolved")
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      flash[:success] = "Your inquiry has been registered."
      redirect_to @inquiry
    else
      render 'new'
    end
  end
  
  def edit
    @inquiry = Inquiry.find(params[:id])
  end
  
  def update
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.update_attributes(inquiry_params)
      flash[:success] = "The inquiry has updated."
      redirect_to inquiries_path
    else
      render 'edit'
    end
  end
  
  private
  
    def inquiry_params
      params.require(:inquiry).permit(:contents, :user_id, :category_id, :status_id)
    end
  
end
