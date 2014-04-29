class Api::CommentsController < ApplicationController
  before_action :require_signed_in!
  before_action :user_owns_comment?, only: [:destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: {}
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :note_id)
  end

  def user_owns_comment?
    @comment = Comment.find(params[:id])
    redirect_to root_url unless @comment.author == current_user
  end
end