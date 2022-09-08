class SessionsController < ApplicationController

  def new
    @page_title = "Login page"
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      helpers.flash_message :info, 'Login successful'
      redirect_to '/dashboard'
    else
      helpers.flash_message :dark, 'Account does not exist, please register'
      redirect_to '/login'
    end
  end
  
 def destroy
   session[:user_id] = nil
   helpers.flash_message :info, 'Logout successful '
   redirect_to '/login'
  end
 end