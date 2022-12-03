class FilmsController < ApplicationController

  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
  end

  def new
  end

  def create
  end


  private
  
  def film_params
    params.permit(:name,:release_year,:best_picture_oscar)
  end
end
