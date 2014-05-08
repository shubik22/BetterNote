class UsersController < ApplicationController
  before_action :require_signed_out!, only: [:new, :create]
  before_action :authorized?, only: [:show]

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      @user.notebooks.create({
        name: "First notebook!"
      })
      @user.notes.create({
        title: "Welcome to BetterNote!",
        body: "",
        notebook_id: @user.notebooks.first.id
      })
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new, layout: "public"
    end
  end

  def new
    @user = User.new
    render :new, layout: "public"
  end

  def index
    @users = User.all
    @users.delete_at(@users.find_index(current_user))
    render :index
  end

  def show
    @user = User.includes(:notes).find(params[:id])
    @notebooks = Notebook.all

    if params[:note_id] && @note = Note.where(id: params[:note_id]).first
      @note = Note.find(params[:note_id])
    else
      redirect_to user_url(@user, note_id:
        @user.notes.sort_by { |n| n.created_at }.last.id)
      return
    end

    if params[:query] && params[:query] != ""
      @notes = @user.notes.search_by_title_and_body(params[:query])
      render :show
      return
    else
      @notes = @user.notes
      render :show
    end
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