class UsersController < ApplicationController
  before_action :require_signed_out!, only: [:new, :create]
  before_action :authorized?, only: [:show]

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def index
    @users = User.all
    @users.delete_at(@users.find_index(current_user))
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private
  def authorized?
    user = User.find(params[:id])
    unless (current_user == user || user.find_friendship(current_user))
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end