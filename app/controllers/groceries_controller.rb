class GroceriesController < ApplicationController
  def index
    @groceries = Grocery.all
  end

  def new
  end

  def create
    grocery = Grocery.new(
    name: params[:name],
    user_id: current_user.id,
    made_by: params[:made_by],
    expiration_date: params[:expiration_date]
    )

    if grocery.save
      flash[:succse] = "succesfully create grocery!"
      redirect_to "/groceries/#{grocery.id}"
    else
      flash[:warning] = "Please try again!"
      redirect_to "/groceries/new"
    end

  end

  def show

    @grocery = Grocery.find_by(id: params[:id])

  end

  def edit
    
  end

  def update

  end

  def destroy
  end
end
