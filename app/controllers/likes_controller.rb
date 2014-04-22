class LikesController < ApplicationController
  def create
    @like = current_user.likes.new({note_id: params[:note_id]})
    if @like.save
      redirect_to user_note_url(@like.note.author, @like.note)
    else
      flash[:errors] = @like.errors.full_messages
      redirect_to user_note_url(@like.note)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to user_note_url(@like.note.author, @like.note)
  end
end