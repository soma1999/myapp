class CelebsController < ApplicationController
  before_action :celeb_new, only: [:new, :new_second]

  def new
  end

  def create
    @celeb = Celeb.new(celebs_parameter)
    if @celeb.save
      redirect_to  new_celeb_path
    else
      render :new
    end
  end

  def show
    @celeb = Celeb.find(params[:id])
    @rooms = Room.where(celeb_id: @celeb.id).order("created_at DESC")
    @blocks = Block.where(room_id: @celeb.rooms)
    @total_price = 0

    @rooms.each do |room|
      @room_orders = room.orders
      @room_orders.each do |room_order|
        @order_price = room_order.price.content.to_i
        @total_price += @order_price
      end
    end
  end

  def new_second
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end

  def login
    celeb = Celeb.find_by(email: params[:email] )
    if celeb && celeb.authenticate(params[:password])
      session[:user_id]=celeb.id
      redirect_to "/celebs/#{celeb.id}", notice: 'ログインしました'
    else
      flash[:notice]= 'Eメールまたはパスワードが違います。'
      render :new_second
    end
  end

  private

  def celebs_parameter
    params.require(:celeb).permit(:name,:email,:password,:description,:image)
  end

  def celeb_new
    @celeb = Celeb.new
  end
end
