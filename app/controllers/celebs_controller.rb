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

  private

  def celebs_parameter
    params.require(:celeb).permit(:name,:email,:password_digest,:description)
  end
end
