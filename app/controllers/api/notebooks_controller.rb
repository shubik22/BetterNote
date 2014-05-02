class Api::NotebooksController < ApplicationController
  before_action :require_signed_in!
  before_action :user_owns_notebook?, only: [:edit, :update, :destroy, :show]

  def create
    @notebook = current_user.notebooks.new(notebook_params)
    if @notebook.save
      render json: @notebook
    else
      render json: @notebook.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    @notebooks = current_user.notebooks
    render "notebooks/index"
  end

  def show
    @notebook = Notebook.includes(:notes).find(params[:id])
    render "notebooks/show"
  end

  def update
    @notebook = Notebook.includes(:notes).find(params[:id])
    if @notebook.update_attributes(notebook_params)
      render json: @notebook.to_json(include: :notes)
    else
      render json: @notebook.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @notebook = Notebook.find(params[:id])
    @notebook.destroy
    render json: {}
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