class UsersController < ApplicationController

  def new
    @user = User.new
  end



  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:alert] = 'Thank You! User created!😬'
      redirect_to new_user_path
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit( [:first_name, :last_name, :email, :password, :password_confirmation])
  end


end
