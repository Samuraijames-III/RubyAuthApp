class LoginController < ActionController::Base
   def show
   
   end

   def login
      return_users = User.where(first_name: params[:fname], last_name: params[:lname])
      render plain: "return users#{return_users[0]}"
   end
end

