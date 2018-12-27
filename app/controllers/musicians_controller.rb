class MusiciansController < ApplicationController

  def new
    @musician = Musician.new
  end

  def login
  end

  def create
    @musician = Musician.create(musician_params)
    redirect_to musician_path(@musician)
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def index
    @musicians = Musician.all
  end


  private

  def musician_params
    params.require(:musician).permit(:name, :instrument, :description, :time_for_music)
  end

end
