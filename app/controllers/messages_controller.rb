class MessagesController < ApplicationController
  before_action :search_celeb, only: [:create]
  before_action :ensure_current_user, only: [:create, :destroy]


  def create
    @room = Room.find(params[:room_id])
    if current_user
      @message = Message.new(user_comment_params)
      if @message.save
        user_image = Rails.application.routes.url_helpers.rails_blob_path(@room.user.image, only_path: true)
        ActionCable.server.broadcast 'message_channel', content: @message, user_image: user_image, room_id: @room.id
      else
        message_render_set
        @prices = Price.all
        @celebs_max = Celeb.all
      end
    else
      @message = Message.new(celeb_comment_params)
      if @message.save
        celeb_image = Rails.application.routes.url_helpers.rails_blob_path(@room.celeb.image, only_path: true)
        ActionCable.server.broadcast 'message_channel', content: @message, celeb_image: celeb_image, room_id: @room.id
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

  def ensure_current_user
    @room = Room.find(params[:room_id])
    if current_user
      unless current_user.id == @room.user.id
        redirect_to root_path
      end
    elsif @current_celeb
      unless @current_celeb.id == @room.celeb.id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
end

