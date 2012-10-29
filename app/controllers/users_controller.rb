class UsersController < ApplicationController
  def signup
  	@user = User.new
  end
  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = 'Welcome'
  		redirect_to @user
  	else
  		render 'signup'		
  	end
  end

  def index
  	@user = User.all
  end
  def show
  	@user = User.find(params[:id])
  end	
end
