class HomesController < ApplicationController
  def index
    @celebs = Celeb.all.order("created_at DESC").page(params[:page]).per(24)
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
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
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
