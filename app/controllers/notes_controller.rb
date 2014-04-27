class NotesController < ApplicationController
  before_action :require_signed_in!
  before_action :user_owns_note?, only: [:edit, :update, :destroy]
  before_action :authorized?, only: [:show]

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      redirect_to notebook_url(@note.notebook, note_id: @note.id)
    else
      flash.now[:errors] = @note.errors.full_messages
      render :new
    end
  end

  def index
    if params[:note_id] && @note = Note.where(id: params[:note_id]).first
      @note = Note.find(params[:note_id])
    end

    if params[:query] && params[:query] != ""
      @notes = current_user.notes.search_by_title_and_body(params[:query])
      render :index
      return
    else
      @notes = current_user.notes
      render :index
    end
  end

  def update
    @note = Note.find(params[:id])

    @note.assign_attributes(note_params)
    @note.tag_ids = note_tag_params[:tag_ids]

    if @note.save
      redirect_to request.env["HTTP_REFERER"].gsub("&edit=true", "")
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @note = Note.find(params[:id])
    render :show
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to :back
  end

  private
  def user_owns_note?
    @note = Note.find(params[:id])
    redirect_to root_url unless @note.author == current_user
  end

  def authorized?
    author = Note.find(params[:id]).author
    unless (current_user == author || user.find_friendship(current_user))
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