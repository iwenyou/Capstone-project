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
    password: params[:password]
    )

    if user.save
      login(user)
      flash[:succse] = "succesfully create account!"
      redirect_to "/user/show"
    else
      flash[:warning] = "error occured during creating user, please try again"
      redirect_to "/user/new"
    end

  end

  def show
    user = current_user

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
