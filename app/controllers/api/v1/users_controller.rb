class Api::V1::UsersController < ApplicationController
  def index
    @user = current_user
    render "index.json.jbuilder"
  end
end
