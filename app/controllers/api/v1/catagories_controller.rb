class Api::V1::CatagoriesController < ApplicationController
  def index
    @catagories = Catagory.all
    render "index.json.jbuilder"
  end
end
