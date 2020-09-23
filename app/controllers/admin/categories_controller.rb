class Admin::CategoriesController < AdminController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = 'Create category successfully'
      redirect_to root_path
    else
      flash[:alert] = 'Create category failed'
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit :parent_id, :name
  end
end
