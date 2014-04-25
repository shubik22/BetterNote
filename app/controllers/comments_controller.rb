class CommentsController < ApplicationController
  before_action :require_signed_in!
  before_action :user_owns_comment?, only: [:destroy]

  def new
    @note = Note.find(params[:note_id])
    render :new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to :back
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :note_id)
  end

  def user_owns_comment?
    @comment = comment.find(params[:id])
    redirect_to root_url unless @comment.owner == current_user
  end
end