require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "#new" do
    it "assigns a new category to @categories" do
      get :new
      expect(response).to render_template(:new)
    end

    it "befor create a presisted category" do
      get :new
      expect(assigns(:category)).to be_a_kind_of(Category)
    end
  end

  describe "#index" do
    it "assigns categories" do
      Category.create(name: 'Macbook')
      get :index
      categories = assigns(:categories)
      expect(categories.size).to eql(1)
    end

     it "renders the index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#create" do
    context "success" do
      it "create a presisted category" do
        post :create, params: { category: {name:'Macbook'}}
        expect(Category.count).to eql(1)
      end

      it "redirect to category index page" do
        post :create, params: { category: {name:'Macbook'}}
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
