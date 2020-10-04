class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.last(20)
  end

  def show
    @product = Product.find(params[:id])
    @review = @product.reviews.new
    @reply = Reply.new
  end
end
