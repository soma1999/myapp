class BlocksController < ApplicationController
  before_action :ensure_current_user, only: [:create, :destroy]

  def create
    @block = Block.create!(room_id: params[:room_id])
    redirect_to celeb_path(@current_celeb.id)
  end

  def destroy
    @block = Block.find(params[:id])
    @block.destroy
    redirect_to celeb_path(@current_celeb.id)
  end

  private

  def ensure_current_user
    @room = Room.find(params[:room_id])
    unless @current_celeb.id == @room.celeb.id
      redirect_to root_path
    end
  end

end
