# frozen_string_literal: true

# ProductsController
class ProductsController < ApplicationController
  def index
    @products = Product.last(20)
  end

  def show
    @product = Product.find(params[:id])
    @review = @product.reviews.new
    @reply = Reply.new
  end
end
