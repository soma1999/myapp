class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
  end

  def confirm
    inquiry_new
    if @inquiry.valid?
      render :confirm
    else
      render :index
    end
  end

  def thanks
    inquiry_new
    InquiryMailer.received_email(@inquiry).deliver
    render :thanks
  end

  private 
  def confirm_parameter
    params.require(:inquiry).permit(:name,:email,:message)
  end

  def inquiry_new
    @inquiry = Inquiry.new(confirm_parameter)
  end
end
