class Admin::ReviewsController < AdminController
  def index
    @reviews = Review.all
  end
end
