require 'bcrypt'

class PasswordsController < ApplicationController
    include BCrypt

    def update
        user = current_user
        failed = false;
    
        #check if this is the currently logged in user
        if  !user.authenticate(params[:password])
            helpers.flash_message :danger, "current password doesnt match, please try again #{user.authenticate(params[:password])}"
            failed = true;
        end
        
        #if new password doesnt match confirm password
        if  params[:new_password] != params[:new_password_confirm]
            helpers.flash_message :danger, "password confirm needs to match, please try again"
            failed = true;
        elsif user.authenticate(params[:new_password])
            helpers.flash_message :danger, "need to enter a new password, please try again"
            failed = true;
        end
        
        if failed
            redirect_to '/dashboard'
        else
            user.password = params[:new_password_confirm];
            user.save
            redirect_to '/passwordchangesuccess'
        end
    end
end