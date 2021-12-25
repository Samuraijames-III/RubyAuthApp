class RegisterController < ActionController::Base
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
          flash[:danger] = "sername '#{params[:username]}' has been taken, try another username, thanks bitch"

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
        format.html { render :index }
      else 
        # create a new user
        user=User.create(
          first_name: params[:fname], 
          last_name: params[:lname],
          username: params[:username],
          password: params[:password]
        )
        # renders the success page
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