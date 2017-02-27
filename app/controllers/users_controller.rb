class UsersController < ApplicationController
  def index

  end

  def new

  end

  def create

    user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password_digest: params[:password]
    )

    if user.save
      session[:id] = user.id
      flash[:succse] = "succesfully create account!"
      redirect_to "/user/index"
    else
      flash[:warning] = "error occured during creating user, please try again"
      redirect_to "/user/new"
    end

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
