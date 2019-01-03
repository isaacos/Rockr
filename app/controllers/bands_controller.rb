class BandsController < ApplicationController

  def new
    @band = Band.new
  end

  def create
    @band = Band.create(band_params)
    redirect_to band_path(@band)
  end

  def edit
    @musician = Musician.find(session[:musician_id])
    @band = Band.find(params[:id])
    @addable_musicians = @band.musicians_not_in_band
    @addable_musicians << current_musician
  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)
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
