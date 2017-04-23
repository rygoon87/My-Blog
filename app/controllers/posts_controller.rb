class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_post, only: [:udpate, :edit, :destroy, :show]

  def index
    @last_post = Post.last
    @posts = Post.offset(1).limit(12).order('created_at DESC')

  end

  def new
    @post = Post.new
  end

  def create
  post_params = params.require(:post).permit(:title, :body)
  @post = Post.new(post_params)
  @post.user = current_user

  if @post.save
      redirect_to post_path(@post)
      flash[:notice] = "Your Post Have Successfully Created 👍"
    else
      flash.now[:alert] = "Please fix your errors ☠️"
      render :new
    end

  end

    def show
        @post = Post.find params[:id]
        @review = Review.new
      end

    def edit
        redirect_to root_path, alert: 'access denied' unless can? :edit, @post
      end

      def update

        @post = Post.find params[:id]
        post_params = params.require(:post).permit([:title, :body ])

        if !(can? :edit, @post)
          redirect_to root_path, alert: 'Access denied☠️'
        elsif @post.update(post_params)
          redirect_to post_path(@post), notice: 'Post updated✌️'
        else
          render :edit
        end
      end

      def destroy
        if (can? :destroy, @post)
          @post.destroy
          redirect_to root_path, notice: 'Post Deleted💀'
        else
          redirect_to root_path, alert: 'Access denied☠️'
        end
      end

      private

      def find_post
        @post = Post.find params[:id]
      end

      def post_params
        post_params = params.require(:post).permit([:title, :body])
      end

end
