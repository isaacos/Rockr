class ReviewsController < ApplicationController

  def create
    @review = Review.create(review_params)
    if @review.valid?
      redirect_to band_path(@review.band)
    else

      @errors = @review.errors.full_messages
      byebug
      redirect_to band_path(@review.band)
    end
  end

  private

  def review_params
    params.require(:review).permit(:band_id, :comment, :stars)
  end
end
