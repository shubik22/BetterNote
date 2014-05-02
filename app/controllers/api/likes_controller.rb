class Api::LikesController < ApplicationController
  before_action :require_signed_in!

  def create
    @like = current_user.likes.new({note_id: params[:note_id]})
    if @like.save
      render json: @like
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    render json: {}
  end
end