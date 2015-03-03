class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(code: params[:session][:code].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = user.name + " san, Welcome back!"
      redirect_to inquiries_path
    else
      flash.now[:error] = 'Invalid code/password combination'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
end
