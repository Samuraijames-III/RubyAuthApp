class UsersController < ActionController::Base
   require "user"
   def index
      userdata = {
         "users": [
            User.new('Jeanette', 'Penddreth', 1),
            User.new('Giavani', 'Frediani', 2),
            User.new('Noell', 'Bea', 3),
            User.new('Willard', 'Valek', 4)
         ]
      }
    # rendering json on page: user data
      render json: userdata
   end

   def show
      jen = User.new('Jeanette', 'Penddreth', 1),
      userdata = {
         "users": [
            User.new('Jeanette', 'Penddreth', 1),
            User.new('Giavani', 'Frediani', 2),
            User.new('Noell', 'Bea', 3),
            User.new('james', 'cassello', 1),
            User.new('Willard', 'Valek', 4)
         ]
      }
      #  render plain: params[:id]
      render json: userdata[:users].select {|user| user.get_id() == params[:id].to_i}
      # render json: user.User_Identification
   end
end