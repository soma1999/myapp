class SearchesController < ApplicationController

  before_action :search_celeb, only: [:search]

  def search
    @room = Room.find(params[:room_id])
    @results = @p.result.all
    @celeb = Celeb.find(@room.celeb_id)
    @celebs = Celeb.all
    @message = Message.new
    @messages = Message.where(room_id: @room).order("created_at ASC")
    render template: "rooms/show"

    
  end

  private

  def search_celeb
    @p = Celeb.ransack(params[:q])
  end
end
