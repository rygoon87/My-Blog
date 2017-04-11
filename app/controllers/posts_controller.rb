class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index

  end

  def new
    @post = Post.new

  end

  def create
  post_params = params.require(:post).permit(:title, :body)
  @post = Post.new(post_params)
  @post.user = current_user

  if @post.save
      redirect_to home_show_path(@post), notice: "Your Post Have Successfully Created 👍"
    else
      render :new
    end

  end

end
