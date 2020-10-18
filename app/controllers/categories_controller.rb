# frozen_string_literal: true

# CategoriesController
class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @categories = Category.search(params[:search])
  end
end
