class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.find(params[:user_id])
    @posts = user.liked_posts
    @last_post = Post.last
    @allposts = Post.order('created_at desc')
  

    render 'posts/index'
  end

  def create
    post = Post.find(params[:post_id])

    if cannot? :like, post
      redirect_to(
        post_path(post), alert: 'Liking your own post is digusting🤢'
        )
        return # early return to prevent execution of anything
               # after the redirect above
    end


    like = Like.new(user: current_user, post: post)

    if like.save
      redirect_to post_path(post), notice: 'Liked post! 👍'
    else
      redirect_to post_path(post), alert: like.errors.full_messages.join(', ')
    end
  end

  def destroy
    like = Like.find(params[:id])

    if cannot? :like, like.post
      redirect_to(
        post_path(post),
        alert: 'Un-liking your own post is prepostrous 👎'
      )
      return # early return to prevent execution of anything
      # after the redirect above
    end


    if like.destroy
      redirect_to post_path(like.post), notice: 'Disliked post! 👎'
    else
      redirect_to post_path(like.post), alert: like.errors.full_messages.join(', ')
    end
  end




end
