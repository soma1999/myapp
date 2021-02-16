class UserCommentsController < ApplicationController

  def create
    @user_comment = UserComment.create(user_comment_params)
    redirect_to room_path(@user_comment.room_id)
  end

  private

  def user_comment_params
    params.require(:user_comment).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
