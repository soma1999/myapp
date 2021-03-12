class RoomsController < ApplicationController


  def find_or_create_by
    room = Room.find_or_create_by(celeb_id: params[:celeb_id], user_id: current_user.id)
    redirect_to room_path(room)
  end

  def show
    @p = Celeb.ransack(params[:q])
    @results = @p.result
    @room = Room.find(params[:id])
    @celeb = Celeb.find(@room.celeb_id)
    @celebs_max = Celeb.all
    @message = Message.new
    @messages = Message.where(room_id: @room).order("created_at ASC")
    price_create
    @prices = Price.all.order(:id)
    @like = Like.find_by(room_id: @room.id)

    if user_signed_in?
      @messages_celeb = @messages.where(celeb_id: @celeb.id)
      @messages_celeb.each do |message_celeb|
        message_celeb.update(read: 1)
      end
    else
      @messages_user = @messages.where(user_id: @room.user_id)
      @messages_user.each do |message_user|
        message_user.update(read: 1)
      end
    end
  end

  private 

  def price_create
    @price_300 = Price.find_or_create_by(content: "300")
    @price_500 = Price.find_or_create_by(content: "500")
    @price_1000 = Price.find_or_create_by(content: "1000")
    @price_2000 = Price.find_or_create_by(content: "2000")
  end
end