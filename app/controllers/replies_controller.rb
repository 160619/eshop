class RepliesController < ApplicationController
  def new
    @review = Review.find(params[:review_id])
    @reply = @review.replies.new
  end

  def create
    @review = Review.find(params[:review_id])
    @reply = @review.replies.new(reply_params)
    @reply.user_id = current_user.id
    if @reply.save
      redirect_to review_path(@reply.review), notice: 'reply was successfully created.'
    else
      render 'reviews/show'
    end
  end

  def show
    @reply = Reply.find(params[:id])
    @review = @reply.review
  end


private
  def reply_params
    params.require(:reply).permit(:reply_id, :comment)
  end
end
