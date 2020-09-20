class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html {redirect_to @review.product, notice: 'review was successfully created '}
        format.js
        format.json {render json: @review, status: :created, location: @user }
      else
        format.html {render "product/show"}
        format.json {render json: @review.errors, status: :unprocessable_emtity}
      end
    end
  end

  def show
    @review = Review.find(params[:id])
    @product = @review.product
    @reply = @review.replies.new
  end


private
  def review_params
    params.require(:review).permit(:user_id, :content, :rating, :product_id)
  end
end
