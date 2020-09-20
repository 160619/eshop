class RepliesController < ApplicationController
  def new
    @review = Review.find(params[:review_id])
    @reply = @review.replies.new
  end

  def create
    @review = Review.find(params[:review_id])
    @reply = @review.replies.new(reply_params)
    @reply.user_id = current_user.id

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @review.product, notice: 'reply was successfully created.' }
        format.js
        format.json { render json: @reply, status: :created, location: @user }
      else
        format.html { render "products/show" }
        format.json {render json: @reply.errors, status: :unprocessable_emtity}
      end
    end
  end

  def show
    @reply = Reply.find(params[:id])
    @review = @reply.review
  end


private
  def reply_params
    params.require(:reply).permit(:review_id, :comment)
  end
end
