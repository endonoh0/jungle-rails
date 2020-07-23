class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_USERNAME"], password: ENV["BASIC_AUTH_PASSWORD"]

  def index
    @category = Category.order(id: :asc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)

    if @category.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end
end
