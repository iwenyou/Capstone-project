class GroceriesController < ApplicationController
  def index
    @groceries = Grocery.where(user_id: current_user.id)
  end

  def new
    @catagories = Catagory.all
  end

  def create
    grocery = Grocery.new(
    name: params[:name],
    user_id: current_user.id,
    made_by: params[:made_by],
    expiration_date: params[:expiration_date]
    )

    if grocery.save
      GroceryCategory.create(
      grocery_id: grocery.id,
      catagory_id: params[:catagory_id]
      )
      flash[:succse] = "succesfully create grocery!"
      redirect_to "/groceries/#{grocery.id}"
    else
      flash[:warning] = "Please try again!"
      redirect_to "/groceries/new"
    end

  end

  def show

    @grocery = Grocery.find_by(id: params[:id])

    @catagories = @grocery.catagories

  end

  def edit

    @grocery = Grocery.find_by(id: params[:id])

  end

  def update
    @grocery = Grocery.find_by(id: params[:id])

    @grocery.name = params[:first_name]
    @grocery.made_by = params[:made_by]
    @grocery.expiration_date = params[:expiration_date]

    if @grocery.save
      flash[:succse] = "succesfully updated information!"
      redirect_to "/groceries/#{@grocery.id}"
    else
      flash[:warning] = "unexpect error occured, please check your input and try again. "
      redirect_to "/groceries/edit"
    end

  end

  def destroy
    @grocery = Grocery.find_by(id: params[:id])

    if @grocery.destroy
      redirect_to "/groceries/"
    else
      flash[:warning] = "unable to delete grocery!"
      redirect_to "/groceries/#{@grocery.id}"
    end

  end
end
