class LikesController < ApplicationController
  before_action :room_set
  before_action :ensure_current_user, except: [:room_set]

  def create
    @like = Like.create(room_id: @room.id, user_id: current_user.id)
    redirect_to room_path(@room)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to room_path(@room)
  end

  private

  def room_set
    @room = Room.find(params[:room_id])
  end

  def ensure_current_user
    if current_user.id != @room.user.id
      redirect_to root_path
    end
  end
end
