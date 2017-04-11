class HomeController < ApplicationController
  def index
    @last_post = Post.last
    @posts = Post.offset(1).limit(12).order('created_at DESC')
    
  end

  def show
      @post = Post.find params[:id]

  end

  private

  def post_params

    post_params = params.require(:post).permit([:title, :body, :created_at, :id])

  end

end
