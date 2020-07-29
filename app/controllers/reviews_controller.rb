class ReviewsController < ApplicationController

  def new
    before_filter :authorize
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to :back, notice: 'Review created!'
    else
      redirect_to product_path(@product.id)
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product.id), notice: 'Product deleted!'
  end

  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :rating,
      :description)
  end
end
