module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logout
    @current_user = session[:user_id] = nil
  end

  def authenticate_user!
    redirect_to '/login' unless current_user
  end
end
