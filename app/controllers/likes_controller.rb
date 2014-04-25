class LikesController < ApplicationController
  def create
    @like = current_user.likes.new({note_id: params[:note_id]})
    if @like.save
      redirect_to :back
    else
      flash[:errors] = @like.errors.full_messages
      redirect_to note_url(@like.note)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to :back
  end
end