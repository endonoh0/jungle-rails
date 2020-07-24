class ProductsController < ApplicationController
  helper_method :sold?

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

  def sold?(quantity)
    quantity === 0 ? true : nil
  end

end
