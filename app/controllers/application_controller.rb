class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_celeb

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image, :first_name, :last_name, :first_name_katakana, :last_name_katakana, :birthday])
  end

  def current_celeb
    if session[:user_id]
    @current_celeb = Celeb.find_by(id: session[:user_id])
    end
  end
end
