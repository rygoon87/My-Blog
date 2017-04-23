class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
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

  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find params[:id]
    user_params = params.require(:user).permit([:first_name, :last_name, :email, :password ])

    if !(can? :edit, @user)
      redirect_to root_path, alert: 'Access denied☠️'
    elsif @user.update(user_params)
      redirect_to user_path(@user), notice: 'User updated✌️'
    else
      render :edit
    end
  end



  def destroy
      User.find(params[:id]).destroy
      session[:user_id] = nil
      flash[:notice] = "User deleted😭"
      redirect_to root_path
    end

    def admin_destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_dashboard_index_path, notice: 'User Deleted 😈!!! '
    end

private

  def user_params
    params.require(:user).permit( [:first_name, :last_name, :email, :password, :password_confirmation])
  end


end
