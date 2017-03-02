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
      redirect_to "/user"
    else
      flash[:warning] = "error occured during creating user, please try again"
      redirect_to "/user/new"
    end

  end

  def show
    @user = current_user

  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.save
      flash[:succse] = "succesfully create account!"
      redirect_to "/user"
    else
      flash[:warning] = "unexpect error occured, please check your input and try again. "
      redirect_to "/user/edit"
    end

  end

  def destroy
    @user = current_user
    if @user.password === params[:password]
      @user.destroy
      redirect_to "/user/login"
    else
      flash[:warning] = "Wrong password, please try again."
      redirect_to "/user/destroy"
    end
  end

end
