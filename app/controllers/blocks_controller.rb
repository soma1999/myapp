class BlocksController < ApplicationController

  def create
    @block = Block.create!(room_id: params[:room_id])
    redirect_to celeb_path(@current_celeb.id)
  end

  def destroy
    @block = Block.find(params[:id])
    @block.destroy
    redirect_to celeb_path(@current_celeb.id)
  end

end
