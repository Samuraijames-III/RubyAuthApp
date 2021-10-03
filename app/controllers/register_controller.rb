class RegisterController < ActionController::Base
   def createuser
    respond_to do |format|
      if params[:fname] == "" || params[:lname] == ""
        format.html { render :failure, locals: {} }
      else 
        format.html { render :success, locals: {fname: params[:fname], lname: params[:lname] } }
      end
    end
   end
end