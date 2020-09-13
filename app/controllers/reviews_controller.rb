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
    if @review.save
      @product.calculate_rating
      redirect_to product_path(@review.product), notice: 'Review was successfully created.'
    else
      render 'products/show'
    end
  end

  def show
    @review = Review.find(params[:id])
    @product = @review.product
    @reply = @review.replies.new
  end


private
  def review_params
    params.require(:review).permit(:user_id, :content, :rating)
  end
end
