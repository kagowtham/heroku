class ApplicationController < ActionController::API

  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception

  def current_user
    @current_user || User.find_by(id: session[:user_id])
  end

  def require_authentication
    if current_user.nil?
      render json: {error: "You must login first"}, status: 401
    end
  end
end
