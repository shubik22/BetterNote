class NotesController < ApplicationController
  before_action :require_signed_in!
  before_action :user_owns_note?, only: [:edit, :update, :destroy]
  before_action :authorized?, only: [:show]

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      redirect_to user_notebook_url(current_user, @note.notebook)
    else
      flash.now[:errors] = @note.errors.full_messages
      render :new
    end
  end

  def index
    @notes = current_user.notes
    @note = Note.find(params[:note_id]) if params[:note_id]
    render :index
  end

  def edit
    @note = Note.find(params[:id])
    render :edit
  end

  def update
    @note = Note.find(params[:id])

    @note.assign_attributes(note_params)
    @note.tag_ids = note_tag_params[:tag_ids]

    if @note.save
      redirect_to user_note_url
    else
      flash.now[:errors] = @note.errors.full_messages
      render :edit
    end
  end

  def show
    @note = Note.find(params[:id])
    render :show
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to user_notebook_url(current_user, @note.notebook)
  end

  private
  def user_owns_note?
    @note = Note.find(params[:id])
    redirect_to root_url unless @note.author == current_user
  end

  def authorized?
    user = User.find(params[:user_id])
    unless (current_user == user || user.find_friendship(current_user))
      redirect_to root_url
    end
  end

  def note_params
    params.require(:note).permit(:title, :body, :notebook_id)
  end

  def note_tag_params
    params.require(:note_tags).permit(tag_ids: [])
  end
end