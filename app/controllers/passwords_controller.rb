require 'bcrypt'

class PasswordsController < ApplicationController
    include BCrypt

    def passwordchanged
    end

    def update
        user = current_user;

        #user entered correct password
        if user.authenticate(params[:password])
            helpers.flash_message :danger, "current password doesnt match"
            redirect_to '/dashboard'
        end
        
        puts "#{user.authenticate(params[:password])}"
        puts "is this working #{params[:new_password]}" 
        puts "is this also working #{Password.new(user.password)}" 
        
        #if new password is the same as new password, doesnt not save
        if Password.new(user.password) == params[:new_password]
            helpers.flash_message :danger, "new password can't match current password, please try again"
            redirect_to '/login'
        end
        puts "#{redirect_to '/login'}"

        #if new password doesnt match confirm password
        if params[:new_password] != params[:new_password_confirm]
            helpers.flash_message :danger, "password, password confirm needs to match"
            redirect_to '/dashboard'
        end

        puts "#{params[:new_password] != params[:new_password_confirm]}"

        
        #create a new password and save the user ID
        user.password = params[:new_password] 
        user.save
        
        helpers.flash_message :success, "change successful, logout for new session"
        redirect_to '/passwordchangesuccess'
    end
end


# you need to fix the double redirect error, by checking how rails is redirecting the error message!
