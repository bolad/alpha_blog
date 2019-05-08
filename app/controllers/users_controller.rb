class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
        
  end
  
  def edit
   
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated sucessfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  def show
    @user_article = @user.articles.paginate(page: params[:page], per_page: 2)
  end
  
  private 
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def require_same_user
    if current_user != @user
      flash[:danger] = "You can not edit another user's account"
      redirect_to root_path
    end
  end
  
end