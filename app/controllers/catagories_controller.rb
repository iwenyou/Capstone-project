class CatagoriesController < ApplicationController

  def index

    @catagories = Catagory.all

  end

  def new

  end

  def create
    catagory = Catagory.new(
    name: params[:name]
    )

    # if catagory.save
    #   redirect_to "/catagories"
    # else
    #   flash[:warning] = "unexpect error occured, please try again!"
    #   redirect_to "/catagories/new"

    catagory.save
    redirect_to "/catagories"
  end


end
