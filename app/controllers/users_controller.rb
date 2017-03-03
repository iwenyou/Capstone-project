class UsersController < ApplicationController
  def index

  end

  def new

  end

  def create

    if params[:password] === params[:password_confirmation]
      user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password]
      )
    else
      flash[:warning] = "The two password you entered did not match"
      redirect_to "/users/new"
    end


    if user.save
      login(user)
      flash[:succse] = "succesfully create account!"
      redirect_to "/users/#{user.id}"
    else
      flash[:warning] = "error occured during creating user, please try again"
      redirect_to "/users/new"
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
      redirect_to "/users/#{@user.id}"
    else
      flash[:warning] = "unexpect error occured, please check your input and try again. "
      redirect_to "/users/edit"
    end

  end

  def destroy
    @user = User.find_by(id: params[:id])

    if @user.password == params[:password]
      @user.destroy
      redirect_to "/users/login"
    else
      flash[:warning] = "Wrong password, please try again."
      redirect_to "/users/#{@user.id}"
    end
  end

end
