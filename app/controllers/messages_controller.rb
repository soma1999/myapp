class MessagesController < ApplicationController

  before_action :search_celeb, only: [:create]


  def create
    @room = Room.find(params[:room_id])
    if current_user
      @message = Message.new(user_comment_params)
      respond_to do |format| 
        if @message.save
          ActionCable.server.broadcast 'message_channel', content: @message
          format.html { redirect_to room_path(@room) } 
          format.json { render template: "rooms/show", status: :created, location: @room } 
          format.js 
        else
          @messages = Message.where(room_id: @room).order("created_at ASC")
          @celebs = Celeb.all
          @results = @p.result
          @prices = Price.all
          format.html { render template: "rooms/show"} 
          format.json { render json: @message.errors, status: :unprocessable_entity } 
        end
      end
    else
      @message = Message.new(celeb_comment_params)
      # respond_to do |format| 
        if @message.save
          ActionCable.server.broadcast 'message_channel', content: @message
          # format.html { redirect_to room_path(@room) } 
          # format.json { render template: "rooms/show", status: :created, location: @message } 
          # format.js 
        else
          @messages = Message.where(room_id: @room).order("created_at ASC")
          @celebs = Celeb.all
          @results = @p.result
          format.html { render template: "rooms/show" } 
          format.json { render json: @message.errors, status: :unprocessable_entity } 
        end
      # end
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

end

