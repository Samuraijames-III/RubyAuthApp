class PasswordsController < ApplicationController

    def passwordchanged
    end

    def update
        user = current_user;
        if user.authenticate(params[:password])
            user.password = params[:new_password]
            user.save
            helpers.flash_message :success, 'password change successful, login with new password bitch'
            redirect_to '/passwordchangesuccess'
        else
            helpers.flash_message :danger, 'current password doesnt match'
            redirect_to '/dashboard'
        end
    end
end
