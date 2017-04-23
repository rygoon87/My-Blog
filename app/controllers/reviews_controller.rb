class ReviewsController < ApplicationController


  def create
      @post = Post.find(params[:post_id])
      review_params = params.require(:review).permit(:body )
      @review = Review.new(review_params)
      @review.post = @post
      @review.user = current_user


      if @review.save
        redirect_to post_path(@post), notice: 'Review Created!👍' 
      else
        flash.now[:notice] = 'Review NOT CREATED☠️'
        render 'posts/show'
      end
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to post_path(@review.post), notice: 'Review Deleted YOOOO!!!'
    end


    def admin_destroy
      review = Review.find(params[:id])
      review.destroy
      redirect_to admin_dashboard_index_path, notice: 'Review Deleted YOOOO!!! '
    end
end
