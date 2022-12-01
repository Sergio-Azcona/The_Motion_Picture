class DirectorFilmsController < ApplicationController
  def index
    @director = Director.find(params[:id])
    @films = @director.films
  end
end