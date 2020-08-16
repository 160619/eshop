class ProductsController < ApplicationController
  def new; end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = 'Create product successfully'
      redirect_to root_path
    else
      flash[:alert] = 'Create product failed'
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit :category_id, :name, :description, :price
  end
end
