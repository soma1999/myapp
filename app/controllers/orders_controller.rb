class OrdersController < ApplicationController

  def create
    redirect_to new_card_path and return unless current_user.card.present?

    @price = Price.find(params[:price_id])

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer_token = current_user.card.customer_token 
    Payjp::Charge.create(
    amount: @price.content, 
    customer: customer_token, 
    currency: 'jpy' 
    )

    @room = Room.find(params[:room_id])
    @order = Order.create(price_id: @price.id, room_id: @room.id)
    @message = Message.create(room_id: @room.id, user_id: @room.user.id, content:"#{current_user.nickname}さんから#{@price.content}円が送られました!!")
    ActionCable.server.broadcast 'stanp_channel', content: @message


  end
end
