class HomesController < ApplicationController
  def index
    @celebs = Celeb.all.order("created_at DESC").page(params[:page]).per(18)
    @celebs_all = Celeb.all
    @celeb_order = {}
    @celebs_all.each do |celeb|
      @total_revenue = 0
      @rooms = celeb.rooms
      @rooms.each do |room|
        @orders = room.orders
        @orders.each do |order|
          @total_revenue += order.price.content.to_i
        end
      end
      @celeb_order.store(celeb.name, @total_revenue)
    end

    @celeb_turn = @celeb_order.sort_by{ | k, v | v }.reverse.slice(0, 9)
  end

  def new_guest_user
    user = User.find_or_create_by!(email: 'guest_user@example.com') do |user|
      user.password = '1a' + Faker::Internet.password(min_length: 6)
      user.password_confirmation = user.password
      user.nickname = "ゲスト"
      user.last_name = "山田"
      user.first_name = "太郎"
      user.first_name_katakana = "ヤマダ"
      user.last_name_katakana = "タロウ"
      user.birthday = "1999-12-13"
      user.image.attach(io: File.open('public/images/default-image.png'), filename: 'default-image.png')
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました'
  end

  def new_guest_celeb
    celeb = Celeb.find_or_create_by!(email: 'guest_celeb@example.com') do |celeb|
      celeb.password = '1a' + Faker::Internet.password(min_length: 6)
      celeb.name = "ゲスト"
      celeb.description = "これは架空の人物です。生年月日・年齢・国籍・経歴：いずれも不明。素性については多くの仮説が立てられているが、正確なところはわかっていない。"
      celeb.image.attach(io: File.open('public/images/default-image.png'), filename: 'default-image.png')
    end
    session[:user_id]=celeb.id
    redirect_to root_path, notice: 'ゲスト有名人としてログインしました'
  end

end
