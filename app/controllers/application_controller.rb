class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # This is for views?
  helper_method :current_user, :require_authentication!
  # Refactor with skip_before_filter? 'skip authentication rails'
    # Without before_action :require_authentication was undefined in other controllers
  before_action :require_authentication!, :only => []

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_authentication!
    if current_user.nil?
      flash[:error] = "Please Sign In."
      redirect_back(fallback_location: '/')
    end
  end
end
