class OrdersController < ApplicationController

  def create
    redirect_to new_card_path and return unless current_user.card.present?

    @price = Price.find(params[:price_id])

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
    amount: @price.content, # 商品の値段
    customer: customer_token, # 顧客のトークン
    currency: 'jpy' # 通貨の種類（日本円）
    )

    @room = Room.find(params[:room_id])
    @order = Order.create(price_id: @price.id, room_id: @room.id)

    redirect_to room_path(@room)


  end
end
