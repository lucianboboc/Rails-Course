class AccessController < ApplicationController
  
	before_action :confirm_logged_in, only: [:index]

  def index
    
  end

  def login
    
  end


  def logout
  	session[:user_id] = nil
  	flash[:notice] = "User Logged out"
  	render "login"
  end

  
  def attempt_login
  	
  	if params[:username].present? && params[:password].present?
  		user = User.where(:name => params[:username]).first
  		if user
  			authorized_user = user.authenticate(params[:password])
  		end
  	end

  	if authorized_user
  		session[:user_id] = authorized_user.id
		  flash[:notice] = "You are logged in"
  		redirect_to :action => "index"
  	else
  		flash[:notice] = "Invalid credentials"
  		redirect_to :action => "login"
  	end

  end
  
end
