class NotebooksController < ApplicationController
  before_action :require_signed_in!
  before_action :user_owns_notebook?, only: [:edit, :update, :destroy, :show]

  def new
    @notebook = current_user.notebooks.new
    render :new
  end

  def create
    @notebook = current_user.notebooks.new(notebook_params)
    if @notebook.save
      redirect_to root_url
    else
      flash.now[:errors] = @notebook.errors.full_messages
      render :new
    end
  end

  def index
    @notebooks = current_user.notebooks
    render :index
  end

  def show
    @notebooks = Notebook.all
    @notebook = Notebook.includes(:notes).find(params[:id])

    if params[:note_id] && @note = Note.where(id: params[:note_id]).first
      @note = Note.find(params[:note_id])
    else
      redirect_to notebook_url(@notebook, note_id:
        @notebook.notes.sort_by { |n| n.created_at }.last.id)
      return
    end

    if params[:query] && params[:query] != ""
      @notes = @notebook.notes.search_by_title_and_body(params[:query])
      render :show
      return
    else
      @notes = @notebook.notes
      render :show
    end
  end

  def edit
    @notebook = Notebook.find(params[:id])
    render :edit
  end

  def update
    @notebook = Notebook.find(params[:id])
    if @notebook.update_attributes(notebook_params)
      redirect_to
    else
      flash.now[:errors] = @notebook.errors.full_messages
      render :edit
    end
  end

  def destroy
    @notebook = Notebook.find(params[:id])
    @notebook.destroy
    redirect_to root_url
  end

  private
  def notebook_params
    params.require(:notebook).permit(:name)
  end

  def user_owns_notebook?
    @notebook = Notebook.find(params[:id])
    redirect_to root_url unless @notebook.owner == current_user
  end
end