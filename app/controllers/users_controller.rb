class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @rooms = Room.where(user_id: current_user.id).order("created_at DESC")
    @likes = Like.where(user_id: current_user.id)

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end

end
