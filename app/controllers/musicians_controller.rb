class MusiciansController < ApplicationController

  def new
    @musician = Musician.new
  end

  def login
  end

  def create
    @musician = Musician.new(musician_params)
    @musician.instrument_capitalize
    @musician.save
    redirect_to musician_path(@musician)
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def index
    if params[:instrument_search] && params[:genre][:genre_search] == ""
      @musicians = Musician.where('instrument Like ?', "%#{params[:instrument_search]}")
    elsif params[:instrument_search] == "" && params[:genre][:genre_search]
      @musicians = Musician.genre_type(params[:genre][:genre_search])
    elsif params[:instrument_search] && params[:genre][:genre_search]
      @musicians = Musician.genre_type(params[:genre][:genre_search]).where('instrument Like ?', "%#{params[:instrument_search]}")
    else

      @musicians = Musician.all
    end
  end


  private

  def musician_params
    params.require(:musician).permit(:name, :instrument, :description, :time_for_music, :instrument_search, :genre_search, :genre_ids => [])
  end

end
