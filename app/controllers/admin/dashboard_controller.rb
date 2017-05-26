class Admin::DashboardController < ApplicationController
  before_filter :authorize_admin, only: :index

  def index
    @posts = Post.all.order('created_at DESC')
    @users = User.all.order('created_at DESC')
    @reviews = Review.all.order('created_at DESC')

  end

  def show
      @post = Post.find params[:id]
      @review = Review.new
    end


  def authorize_admin
    redirect_to root_path, alert: 'Access denied' unless current_user.is_admin
  end

  def destroy
    if (can? :destroy, @post)
      @post.destroy
      redirect_to admin_dashboard_index_path, notice: 'Post Deleted💀'
    else
      redirect_to admin_dashboard_index_path, alert: 'Access denied☠️'
    end
  end

end
