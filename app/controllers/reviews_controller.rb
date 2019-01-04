class ReviewsController < ApplicationController

  def create

    @review = Review.create(review_params)
    if @review.valid?
      redirect_to band_path(@review.band)
    else

      flash[:error] = @review.errors.full_messages
      redirect_to band_path(@review.band)
    end
  end

  private

  def review_params
    params.require(:review).permit(:band_id, :comment, :stars)
  end
end
