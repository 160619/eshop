class ProductsController < ApplicationController
  def index
    @products = Product.first(30)
  end

  def show
    @product = Product.find(params[:id])
    @review = @product.reviews.new
    @reply = Reply.new
  end
end
