class Api::NoteTagsController < ApplicationController
  before_action :require_signed_in!

  def create
    @note_tag = NoteTag.new(note_tag_params)
    if @note_tag.save
      render json: @note_tag
    else
      render json: @note_tag.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @note_tag = NoteTag.find(params[:id])
    @note_tag.destroy
    render json: {}
  end

  private
  def note_tag_params
    params.require(:note_tag).permit(:note_id, :tag_id)
  end
end