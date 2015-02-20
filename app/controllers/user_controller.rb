class UserController < ApplicationController

 def login
 end

 def authenticate
   if params[:username] == "admin" and params[:password] == "tripod" then
	session[:loggedin]=true
        flash[:success]="Successfully logged in"
	redirect_to root_path
   else
        flash[:failure]="Invalid credentials"
	redirect_to login_path
  end

 end

 def logout
    session[:loggedin]=false
 end
end
