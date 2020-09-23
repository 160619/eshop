class ProductsController < ApplicationController
  def index
    @products = Product.all.order(:name)
  end

  def show
    @product = Product.find(params[:id])
    @review = @product.reviews.new
    @reply = Reply.new
  end
end
