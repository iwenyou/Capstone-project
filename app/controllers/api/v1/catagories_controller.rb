class Api::V1::CatagoriesController < ApplicationController
  def index
    @catagories = Catagory.all
    render "index.json.jbuilder"
  end

  def create
    grocery = Grocery.new(
    name: params[:name],
    user_id: current_user.id,
    expiration_date: params[:expiration_date]
    )

    if grocery.save
      redirect_to "/api/v1/groceries"
    else
      render json: { errors: grocery.errors.full_messages}, status: 422
    end
  end
end
