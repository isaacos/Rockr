class MusiciansController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.new(musician_params)
    if @musician.valid?
      @musician.instrument_capitalize
      @musician.save
      session[:musician_id] = @musician.id
      redirect_to musician_path(@musician)
    else
      @errors = @musician.errors.full_messages
      render :new
    end
  end

  def edit
    @musician = Musician.find(params[:id])
    unless @musician.id == session[:musician_id]
      redirect_to musician_path(@musician)
    end
  end

  def update
    @musician = Musician.find(params[:id])
    @musician.update(musician_params)
    if @musician.valid?
      @musician.instrument_capitalize
      @musician.save
      redirect_to musician_path(@musician)
    else
      @errors = @musician.errors.full_messages
      render :edit
    end
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def destroy
    @musician = Musician.find(session[:musician_id])
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
