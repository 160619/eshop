# frozen_string_literal: true

# Review
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :replies, dependent: :destroy
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :content, length: { in: 10..120 }

  after_create :calculate_product_rating

  def html_reply_form
    renderer = ReviewsController.renderer.new(http_host: 'localhost')
    renderer.render(
      partial: 'replies/form',
      locals: { review: self, reply: Reply.new }
    )
  end

  private

  def calculate_product_rating
    product.calculate_rating
  end
end
