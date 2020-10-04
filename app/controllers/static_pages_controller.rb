class StaticPagesController < ApplicationController
  def home
    @products = Product.last(12)
  end
end
