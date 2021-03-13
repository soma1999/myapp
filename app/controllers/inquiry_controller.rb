class InquiryController < ApplicationController
  before_action :inquiry_new, only: [:confirm, :thanks]
  before_action :forbid_inquiry, only: [:index, :confirm, :thanks]
  

  def index
    @inquiry = Inquiry.new
    if user_signed_in?
      @user_full_name = current_user.last_name+" "+current_user.first_name
    end
  end

  def confirm
    if @inquiry.valid?
      render :confirm
    else
      render :index
    end
  end

  def thanks
    InquiryMailer.received_email(@inquiry).deliver
  end

  private 
  def confirm_parameter
    params.require(:inquiry).permit(:name,:email,:message)
  end

  def inquiry_new
    @inquiry = Inquiry.new(confirm_parameter)
  end

  def forbid_inquiry
    unless @current_celeb || current_user
      redirect_to root_path
    end
  end
end
