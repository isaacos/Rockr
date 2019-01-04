class BandsController < ApplicationController

  def new
    @band = Band.new
  end

  def create
    @band = Band.create(band_params)
    if @band.valid?
      redirect_to band_path(@band)
    else
      @errors = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @musician = Musician.find(session[:musician_id])
    @band = Band.find(params[:id])
    @addable_musicians = Musician.all

  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)
    if @band.valid?
      redirect_to band_path(@band)
    else
      @errors = @band.errors.full_messages
      render :edit
    end
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
