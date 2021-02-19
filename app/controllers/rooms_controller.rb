class RoomsController < ApplicationController

  def find_or_create_by
    room = Room.find_or_create_by(celeb_id: params[:celeb_id], user_id: current_user.id)
    redirect_to room_path(room)
  end

  def show
    @room = Room.find(params[:id])


      @user_comment = UserComment.new
      @celeb_comment = CelebComment.new     
      @user_comments = UserComment.where(user_id: @room.user_id)
      @celeb_comments = CelebComment.where(celeb_id: @room.celeb_id)
      @comments = (@user_comments + @celeb_comments).order("created_at DESC")
    # else
    #   @celeb_comment = CelebComment.new      
    #   @user_comments = UserComment.all(user_id: @room.user_id)
    #   @celeb_comments = CelebComment.all(celeb_id: @room.celeb_id)
    #   @comments = (@user_comments + @celeb_comments).order("created_at DESC")
    # end
  end
end
