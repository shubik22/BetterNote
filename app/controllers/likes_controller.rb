class LikesController < ApplicationController
  before_action :require_signed_in!
  before_action :user_owns_like?, only: [:destroy]

  def create
    @like = current_user.likes.new(like_params)
    if @like.save
      redirect_to :back
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    render json: {}
  end

  private
  def comment_params
    params.require(:like).permit(:note_id)
  end

  def user_owns_like?
    @like = Like.find(params[:id])
    redirect_to root_url unless @like.owner == current_user
  end
end