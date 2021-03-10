class MessagesController < ApplicationController

  before_action :search_celeb, only: [:create]


  def create
    @room = Room.find(params[:room_id])
    if current_user
      @message = Message.new(user_comment_params)
      if @message.save
        ActionCable.server.broadcast 'message_channel', content: @message 
      else
        message_render_set
        @prices = Price.all
        @celebs_max = Celeb.all
      end
    else
      @message = Message.new(celeb_comment_params)
      if @message.save
        ActionCable.server.broadcast 'message_channel', content: @message
      else
        message_render_set
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to room_path(params[:room_id])
  end

  private

  def user_comment_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  end

  def celeb_comment_params
    params.require(:message).permit(:content).merge(celeb_id: current_celeb.id, room_id: params[:room_id])
  end

  def search_celeb
    @p = Celeb.ransack(params[:q])
  end

  def message_render_set
    @messages = Message.where(room_id: @room).order("created_at ASC")
    @celebs = Celeb.all
    @results = @p.result
  end

end

