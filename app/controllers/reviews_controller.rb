class ReviewsController < ApplicationController

  def create
    @review = Review.create(review_params)
    redirect_to bands_path(@review)
  end

  private

  def review_params
    params.require(:review).permit(:band_id, :comment, :stars)
  end
end
