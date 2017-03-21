class Api::V1::UsersController < ApplicationController
  def index
    @user = current_user
    render "index.json.jbuilder"
  end

  def show
    @user = User.find(params[:id])
    render "show.json.jbuilder"
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email]
      )

      render "index.json.jbuilder"

    else

      render json: { errors: grocery.errors.full_messages}, status: 422

    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy

    redirect_to "/signin"
  end
end
