class ReviewsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]

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
        html_reply_form = render_to_string(
          partial: 'replies/form',
          locals: {review: @review, reply: Reply.new}
        )
        @product.calculate_rating
        format.json {render json: review_serialize(html_reply_form), status: :created }
      else
        format.json {render json: @review.errors.full_messages, status: :unprocessable_entiry }
      end
    end
  end

private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id, :content, :rating, :product_id)
  end

  def review_serialize(reply_form)
    {
      id: @review.id,
      content: @review.content,
      rating: @review.rating,
      user: {
        email: @review.user.email
      },
      product: {
        aggregate_rating: @product.reload.aggregate_rating
      },
      reply_form: reply_form
    }
  end

  def reply_form_html
    render_to_string(
      partial: 'replies/form',
      locals: { review: @review, reply: Reply.new }
    )
  end
end
