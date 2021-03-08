class LikesController < ApplicationController
  before_action :room_set, only: [:create, :destroy]

  def create
    room_set
    @like = Like.create(room_id: @room.id, user_id: current_user.id)
    redirect
  end

  def destroy
    room_set
    @like = Like.find(params[:id])
    @like.destroy
    redirect
  end

  private

  def room_set
    @room = Room.find(params[:room_id])
  end

  def redirect
    redirect_to room_path(@room)
  end
end
