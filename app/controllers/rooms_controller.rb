class RoomsController < ApplicationController

  def find_or_create_by
    room = Room.find_or_create_by(celeb_id: params[:celeb_id], user_id: current_user.id)
    redirect_to room_path(room)
  end

  def show
  end
end
