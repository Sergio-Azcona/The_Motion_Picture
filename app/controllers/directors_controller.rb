class DirectorsController < ApplicationController
  def index
    @directors = Director.all.last_created
  end

  def show
    @director = Director.find(params[:id])
  end
    # require 'pry';binding.pry!!
    # @director = Director.find(params[:id])
    # @new_director = @director.new
    # rendirect_to :create

  def new
  end
  
  def create
    @director = Director.create(director_params)
    if @director.save 
      flash.notice = "New Entry Created"
      redirect_to directors_path
    else
      flash.notice = "Unacceptable Entry - Try Again"
      render :new
    end
  end
  # flash message hide elemtent  https://bobbyhadz.com/blog/javascript-hide-element-after-few-seconds


  private
  def director_params
    params.permit(:name,:best_director_oscars,:multiple_best_director_nominations)
  end
end