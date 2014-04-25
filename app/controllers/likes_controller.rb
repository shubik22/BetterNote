class LikesController < ApplicationController
  def create
    @like = current_user.likes.new({note_id: params[:note_id]})
    if @like.save
      redirect_to user_notebook_url(current_user,
        @like.note.notebook, note_id: @like.note.id)
    else
      flash[:errors] = @like.errors.full_messages
      redirect_to user_note_url(@like.note)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to user_notebook_url(current_user,
        @like.note.notebook, note_id: @like.note.id)
  end
end