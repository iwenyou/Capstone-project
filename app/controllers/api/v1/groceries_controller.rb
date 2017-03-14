class Api::V1::GroceriesController < ApplicationController
  def index
    @groceries = Grocery.where(user_id: current_user.id)
    render "index.json.jbuilder"
  end
end
