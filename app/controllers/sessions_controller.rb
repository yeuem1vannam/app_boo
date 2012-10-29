class SessionsController < ApplicationController
		
  def create
	end
	def signin
  	user = User.find_by_username(params[:session][:username].downcase)
  	if user && user.authenticate(params[:session][:password])
  		sign_in user
  		redirect_back_or user
  	else
  		flash.now[:error] = 'Invalid username/password combination'
  		render 'signin' 		
  	end
  end
  def destroy
  	signout
  	redirect_to root_url  	
  end

  def sign_in(user)
  	cookies.permanent[:remember_token] = user.remember_token
  	self.current_user = user
  end
  def sign_out
  	self.current_user = nil
  	cookies.delete(:remember_token)  	
  end
end
