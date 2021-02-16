class CelebCommentsController < ApplicationController

  def create
    @celeb_comment = CelebComment.create(celeb_comment_params)
    redirect_to room_path(@celeb_comment.room_id)
  end

  private

  def celeb_comment_params
    params.require(:celeb_comment).permit(:content).merge(celeb_id: current_celeb.id, room_id: params[:room_id])
  end
end
