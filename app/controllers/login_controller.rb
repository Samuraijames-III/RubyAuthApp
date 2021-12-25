class LoginController < ActionController::Base
   
   def show
      @page_title "Login page"
      render :show
   end

   def login
      @page_title "login successful"
      return_users = User.where(first_name: params[:fname], last_name: params[:lname])
      render plain: "return users#{return_users[0]}"
   end
end

