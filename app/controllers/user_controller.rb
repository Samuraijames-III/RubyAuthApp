class UserController < ApplicationController
   def index
    # rendering json on page: user data
      render json: User.all
   end

   def create
      user = User.new(
         first_name: params[:fname], 
         last_name: params[:lname],
         username: params[:username],
         password: params[:password],
         password_confirmation: params[:password_confirmation]
      end

   def show
      #  render plain: params[:id]
      #render json: userdata[:users].select {|user| user.get_id() == params[:id].to_i}
      if User.exists?(params[:id])
         render json: User.find(params[:id].to_i)
      else 
         render plain: "that user doesnt exist: #{params[:id]}"
      end
   end

   def validate
      puts params
      username = params[:username]
      exists = User.exists?(username: username)
      # puts exists
      render json: {"exists": exists, "username": username}
   end
end
