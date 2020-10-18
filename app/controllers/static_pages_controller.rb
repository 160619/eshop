# frozen_string_literal: true

# StaticPagesController
class StaticPagesController < ApplicationController
  def home
    @products = Product.all.page(params[:page]).per(6)
  end
end
