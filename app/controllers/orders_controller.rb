class OrdersController < ApplicationController
  before_action :ensure_current_user

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
    @message = Message.create(room_id: @room.id, user_id: @room.user.id, content:"#{current_user.nickname}さんから#{@price.content}円が送られました!!", order: true)
    @user = User.find(current_user.id)
    @user.update(order: true)
    celeb_image = Rails.application.routes.url_helpers.rails_blob_path(@room.celeb.image, only_path: true)
    ActionCable.server.broadcast 'message_channel', content: @message, celeb_image: celeb_image, room_id: @room.id

  end

  private

  def ensure_current_user
    @room = Room.find(params[:room_id])
    unless user_signed_in? || current_user.id == @room.user.id
      redirect_to root_path
    end
  end
end
