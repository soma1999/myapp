class CardsController < ApplicationController
  before_action :card_register 


  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer = Payjp::Customer.create(
    description: 'test', 
    card: params[:card_token] 
    )

    card = Card.new( 
      card_token: params[:card_token], 
      customer_token: customer.id, 
      user_id: current_user.id 
    )

    if card.save
      redirect_to user_path(current_user.id)
    else
      redirect_to :new
    end
  end

  def card_register
    if current_user == nil ||  current_user.card
      redirect_to root_path
    end
  end
end
