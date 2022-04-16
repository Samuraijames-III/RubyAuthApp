class SessionsController < ApplicationController

  def new
    @page_title = "Login page"
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      helpers.flash_message :success, 'Successfully Logged In'
      helpers.flash_message :success, 'is this even working?!'
      redirect_to '/dashboard'
    else
      helpers.flash_message :warning, 'Invalid Username or Password'
      redirect_to '/login'
    end
  end
  
 def destroy
   session[:user_id] = nil
   helpers.flash_message :warning, 'Successfully Logged Out'
   redirect_to '/login'
  end
 end