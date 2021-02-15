class CelebsController < ApplicationController

  def new
    @celeb = Celeb.new
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
  end

  def new_second
    @celeb = Celeb.new
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
      render :new_second
    end
  end

  private

  def celebs_parameter
    params.require(:celeb).permit(:name,:email,:password,:description)
  end
end
