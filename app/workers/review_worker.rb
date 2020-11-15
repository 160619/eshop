class ReviewWorker
  include Sidekiq::Worker

  def perform(review_id)
    @review = Review.find(review_id)

    return unless @review

    ReviewMailer.thank_user(@review.user).deliver_now
  end
end
