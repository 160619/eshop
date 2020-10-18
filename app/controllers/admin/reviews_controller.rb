# frozen_string_literal: true

module Admin
  # ReviewsController
  class ReviewsController < AdminController
    def index
      @reviews = Review.all
    end
  end
end
