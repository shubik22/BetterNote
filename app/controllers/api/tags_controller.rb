class Api::TagsController < ApplicationController
  before_action :require_signed_in!
  before_action :user_owns_tag?, only: [:edit, :update, :destroy]

  def index
    @tags = current_user.tags
    render "tags/index"
  end

  def create
    @tag = current_user.tags.new(tag_params)
    if @tag.save
      render json: @tag
    else
      render json: @tag.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
      render json: @tag
    else
      render json: @tag.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    render json: {}
  end

  private
  def user_owns_tag?
    @tag = Tag.find(params[:id])
    redirect_to :back unless @tag.owner == current_user
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end