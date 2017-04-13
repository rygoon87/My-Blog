class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'YOU ARE NOW LOGGGGGGEDD INNNNN 👍'
    else
      flash.now[:alert] = '☠️EH....TRY AGAIN☠️'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'PEACE OUT YO 🖖'
  end
end
