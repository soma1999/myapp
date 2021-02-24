class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @rooms = Room.where(user_id: current_user.id).order("created_at DESC")
  end
end
