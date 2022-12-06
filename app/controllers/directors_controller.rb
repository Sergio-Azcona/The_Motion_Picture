class DirectorsController < ApplicationController
  def index
    @directors = Director.all.last_created
  end

  def show
    @director = Director.find(params[:id])
  end
  
  def create
    @director = Director.create(director_params)
    if @director.save 
      flash.notice = "Update Successful"
      redirect_to directors_path
    else
      flash.notice = "Unacceptable Entry - Try Again"
      render :new
    end
  end
  # flash message hide elemtent  https://bobbyhadz.com/blog/javascript-hide-element-after-few-seconds

  def new
    # require 'pry';binding.pry!!
    # @director = Director.find(params[:id])
    @director = Director.new
    # rendirect_to :create
  end

  def edit
    @director = Director.find(params[:id])
    # require 'pry';binding.pry
  end
  
  def update
    @director = Director.find(params[:id])
    @director.update!(director_params)

    flash.notice = "Update Successful"
    redirect_to "/directors/#{@director.id}"
    # ISSUE:
      #  when user goes show>edit>update/show>edit> 
      #radio button for previous result not displaying consistently
  end

  private
  def director_params
    params.permit(:name,:best_director_oscars,:multiple_best_director_nominations)
  end
end