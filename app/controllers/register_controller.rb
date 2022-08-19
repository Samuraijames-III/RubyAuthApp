class RegisterController < ApplicationController
  def index 
    @page_title = "Register account"
  end

  def createuser
    respond_to do |format|
      # Set to true if you want to display an error
      formError = false

      # If the first and last name are filled in, render success. Otherwise we will set flash messages that will show on the index /register page
      if params[:fname] == "" || params[:lname] == ""
        #render the failure page
        format.html { render :failure, locals: {} }
      elsif User.exists?(username: params[:username])
          formError = true
          helpers.flash_message :warning, "Username '#{params[:username]}' has been taken, try another username"

          # Psuedocode - how flash message data is stored
          # var flash = {
          #   'danger': 'User not found.'
          #   'info': 'User not found.'
          #   'warning': 'User not found.'
          #   'danger': 'User not found.'
          # }
      end
      
      if formError
        # Rerender the register form page with flash messages added
        @page_title = "Account creation failed"
        format.html { render :index }
      else 
        # create a new user
        user=User.new(
          first_name: params[:fname],
          last_name: params[:lname],
          username: params[:username],
          # password: params[:password]
        )
        user.password = params[:password]
        user.save

        # renders the success page
        @page_title = "Account creation success"
        format.html {
          render :success, 
          locals: {
            id: user.id, 
            fname: user.first_name, 
            lname: user.last_name,
            username: user.username,
            password: user.password
          }
        }
      end
    end
  end
end