class FilmsController < ApplicationController

  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
  end


  def new
    # require 'pry';binding.pry
    @directors = Director.all
    @film = Film.new
  end
  
  def create
    # require 'pry';binding.pry
    
    # @directors = Director.all
    @film = Film.create(film_params)
    if @film.save 
      flash.notice = "Update Successful"
      redirect_to films_path
    else
      flash.notice = "Unacceptable Entry - Try Again"
      render :new
    end
  end
  # flash message hide elemtent  https://bobbyhadz.com/blog/javascript-hide-element-after-few-seconds

  def edit
    @film = Film.find(params[:id])
  end
  
  def update
    
    @film = Film.find(params[:id])
    @film.update!(film_params)

    flash.notice = "Update Successful"
    redirect_to films_path
  end

  private
  
  def film_params
    params.permit(:name,:release_year,:best_picture_oscar,:director)
  end
end
