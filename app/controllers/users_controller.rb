class UsersController < ApplicationController
  before_action :ensure_current_user

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

  def ensure_current_user
    unless user_signed_in? && params[:id].to_i == current_user.id
      redirect_to root_path
    end
  end

end
