class Api::V1::GroceriesController < ApplicationController
  def index
    render "index.json.jbuilder"
  end
end
