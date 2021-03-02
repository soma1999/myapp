class OrdersController < ApplicationController

  def create
    @price = Price.find(params[:id])
    @room = Room.find(params[:room_id])
    @order = Order.create(price_id: @price.id, room_id: @room.id)
  end
end
