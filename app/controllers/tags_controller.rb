class TagsController < ApplicationController
  before_action :require_signed_in!
  before_action :user_owns_tag?, only: [:edit, :update, :destroy]

  def new
    @tag = current_user.tags.new
    render :new
  end

  def create
    @tag = current_user.tags.new(tag_params)
    if @tag.save
      redirect_to root_url
    else
      flash.now[:errors] = @tag.errors.full_messages
      render :new
    end
  end

  def index
    @tags = current_user.tags
    render :index
  end

  def show
    @tag = Tag.includes(:notes).find(params[:id])
    @notebooks = Notebook.all

    if params[:note_id] && @note = Note.where(id: params[:note_id]).first
      @note = Note.find(params[:note_id])
    else
      redirect_to tag_url(@tag, note_id:
        @tag.notes.sort_by { |n| n.created_at }.last.id)
      return
    end

    if params[:query] && params[:query] != ""
      @notes = @tag.notes.search_by_title_and_body(params[:query])
      render :show
      return
    else
      @notes = @tag.notes
      render :show
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    render :edit
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
      redirect_to
    else
      flash.now[:errors] = @tag.errors.full_messages
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to root_url
  end

  private
  def user_owns_tag?
    @tag = Tag.find(params[:id])
    redirect_to root_url unless @tag.owner == current_user
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end