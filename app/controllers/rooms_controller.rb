class RoomsController < ApplicationController

  def find_or_create_by
    room = Room.find_or_create_by(celeb_id: params[:celeb_id], user_id: current_user.id)
    redirect_to room_path(room)
  end

  def show
    @room = Room.find(params[:id])
    @celeb = Celeb.find(@room.celeb_id)
    @message = Message.new
    @messages = Message.where(room_id: @room).order("created_at ASC")
  end
  
end
