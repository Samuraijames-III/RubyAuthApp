class SessionsController < ApplicationController

  def new
    @page_title = "Login page"
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      helpers.flash_message :success, 'Successfully Logged In'
      redirect_to '/dashboard'
    else
      helpers.flash_message :notice, 'Invalid Username or Password'
      redirect_to '/login'
    end
  end
  
 def destroy
   session[:user_id] = nil
   helpers.flash_message :info, 'Successfully Logged Out'
   redirect_to '/login'
  end
 end