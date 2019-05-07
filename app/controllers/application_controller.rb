class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  
  
  def current_user
    #return current user if current user already exists, if not find user by id
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    #check if current user is logged in using boolean converter !!
    !!current_user
  end
  
  def require_user
    #restrict certain actions based on if there is a user or not
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
    
  end
  
end
