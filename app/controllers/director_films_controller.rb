class DirectorFilmsController < ApplicationController
  def index
    @director = Director.find(params[:id])
    
    if params[:sort] == 'true'
      @films = @director.ordered_alphabetical
    else
      @films = @director.films.all
    end
  end

  def new
    @director = Director.find(params[:id])
    @film = @director.films.new
  end

  def create
    @director = Director.find(params[:id])
    @film = @director.films.create(director_film_params)
    if @film.save 
      flash.notice = "Update Successful"
      redirect_to "/directors/#{@director.id}/films"
    else
      flash.notice = "Unacceptable Entry - Try Again"
      render :new
    end
  end

  private
  def director_film_params
    params.permit(:name,:release_year,:best_picture_oscar)
  end
end