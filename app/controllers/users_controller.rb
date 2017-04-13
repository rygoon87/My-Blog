class UsersController < ApplicationController

  def new
    @user = User.new
  end



  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Thank You! User created!😬'
      redirect_to root_path
    else
      flash[:alert] = 'YOU HAVE FAILED TO CREATE A USER☠️'
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit( [:first_name, :last_name, :email, :password, :password_confirmation])
  end


end
