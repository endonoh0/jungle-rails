class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    # @review = Review.new(review_params)

    # if @review.save
    #   redirect_to :back
    # else
    #   redirect_to root_path
    # end
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to :back, notice: 'Review created!'
    else
      redirect_to [:login]
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :product_id
      :rating
      :description
  end
end
