require 'bcrypt'

class PasswordsController < ApplicationController
    include BCrypt

    def update
        user = current_user;
        
        
        #if new password is the same as new password, doesnt not save
        if  Password.new(current_user.password) == params[:new_password]
            helpers.flash_message :danger, "new password can't match current password, please try again"
            redirect_to '/dashboard'
        end
        
        #if new password doesnt match confirm password
        if  params[:new_password] != params[:new_password_confirm]
            helpers.flash_message :danger, "password, password confirm needs to match, please try again"
            redirect_to '/dashboard' 
        end
        
        #trying to update password, with existing password incorrect in first field.
        if  current_user.password != Password.new(current_user.password)
            helpers.flash_message :danger, "existing password different from original, please try again"
            redirect_to '/dashboard' && return
        end
        

    end
end
    
        #  if  @user.password = params[:new_password_cofirm]
        #      @user.save!
        #      redirect_to '/passwordchangesuccess'
        #  end

        # you need to fix the double redirect error, by checking how rails is redirecting the error message!