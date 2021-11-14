class RegisterController < ActionController::Base
   def createuser
    respond_to do |format|
      if params[:fname] == "" || params[:lname] == ""
        #render the failure page
        format.html { render :failure, locals: {} }
      else
        if User.exists?(username: params[:username])
          format.html {render :message, locals: {message: "that user name is already taken, try again bitch"}}
        end 

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