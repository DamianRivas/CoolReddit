class UsersController < ApplicationController
  protect_from_forgery
  
  def new
    @user = User.new
  end
  
  def confirm
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
  end
  
  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    
    if @user.save
      redirect_to root_path, notice: "Welcome to CoolReddit #{@user.name}!"
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end
end
