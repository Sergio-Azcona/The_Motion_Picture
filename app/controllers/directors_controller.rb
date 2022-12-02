class DirectorsController < ApplicationController
  def index
    @directors = Director.all.last_created
  end

  def show
    @director = Director.find(params[:id])
  end

end