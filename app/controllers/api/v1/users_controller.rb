class Api::V1::UsersController < ApplicationController
  def index
    @user = current_user
    render "index.json.jbuilder"
  end

  def show
    @user = User.find(params[:id])
    render "show.json.jbuilder"
  end
end
