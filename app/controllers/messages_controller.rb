class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    if current_user
      @message = Message.new(user_comment_params)
      if @message.save
        redirect_to room_path(@message.room_id)
      else
        @messages = Message.where(room_id: @room).order("created_at ASC")
        render template: "rooms/show"
      end
    else
      @message = Message.new(celeb_comment_params)
      if @message.save
        redirect_to room_path(@message.room_id)
      else
        @messages = Message.where(room_id: @room).order("created_at ASC")
        render template: "rooms/show"
      end
    end
  end

  private

  def user_comment_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  end

  def celeb_comment_params
    params.require(:message).permit(:content).merge(celeb_id: current_celeb.id, room_id: params[:room_id])
  end
end

