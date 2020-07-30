class ReviewsController < ApplicationController

  def new
    before_filter :authorize
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product.id), notice: "Review has been created 👍"
    else
      redirect_to :back, notice: "Please enter a Review and a Rating."
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product.id), notice: 'Review deleted!'
  end

  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :rating,
      :description)
  end
end
