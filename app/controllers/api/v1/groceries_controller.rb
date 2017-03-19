class Api::V1::GroceriesController < ApplicationController

  def index
    @groceries = Grocery.where(user_id: current_user.id)
    render "index.json.jbuilder"
  end

  def create
    grocery = Grocery.new(
    name: params[:name],
    user_id: params[:user_id],
    expiration_date: params[:expiration_date]
    )

    if grocery.save
      render "index.json.jbuilder"
    else
      render json: { errors: grocery.errors.full_messages}, status: 422
    end
  end

  def update
    grocery = Grocery.find_by(id: params[:id])

    grocery.update(
    name: params[:name],
    expiration_date: params[:expiration_date]
    )

    render json: { errors: grocery.errors.full_messages}, status: 422

  end

  def destroy
    grocery = Grocery.find(params[:id])
    grocery.destroy
    render json: { message: "grocery successfully deleted"}
  end

end
