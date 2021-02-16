class HomesController < ApplicationController
  def index
    @celebs = Celeb.all.order("created_at DESC")
  end
end
