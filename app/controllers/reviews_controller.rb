# frozen_string_literal: true

# ReviewsController
class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: %i[edit update destroy]
  before_action :find_product, only: %i[create]

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @review = @product.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.json { render json: review_serializer, status: :created }
      else
        format.json { render json: @review.errors.full_messages, status: :unprocessable_entiry }
      end
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id, :content, :rating, :product_id).merge!(user_id: current_user.id)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def review_serializer
    {
      id: @review.id,
      content: @review.content,
      rating: @review.rating,
      user: { email: @review.user.email },
      product: {
        aggregate_rating: @product.reload.aggregate_rating
      },
      reply_form: @review.html_reply_form
    }
  end
end
