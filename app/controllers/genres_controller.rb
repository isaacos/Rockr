class GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)
    if @genre.valid?
      redirect_to genre_path(@genre)
    else
      @errors = @genre.errors.full_messages
      render :new
    end
  end

  def index
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    if @genre.valid?
      redirect_to genre_path(@genre)
    else
      @errors = @genre.errors.full_messages
      render :edit
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end



  private

  def genre_params
    params.require(:genre).permit(:genre_name, :description)
  end
end
