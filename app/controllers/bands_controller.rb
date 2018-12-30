class BandsController < ApplicationController

  def new
    @band = Band.new
  end

  def create
    @band = Band.create(band_params)
    redirect_to band_path(@band)
  end

  def show
    @band = Band.find(params[:id])
    @review = Review.new(band_id: params[:id])
  end

  def index
    @bands = Band.all
  end

  private

  def band_params
    params.require(:band).permit(:band_name, :tours, :logo, :musician_ids => [])
  end
end
