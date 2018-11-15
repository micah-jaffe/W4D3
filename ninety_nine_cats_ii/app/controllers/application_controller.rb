class ApplicationController < ActionController::Base
  helper_method :current_user

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end
  def logout!
    self.current_user.reset_session_token! if self.current_user
    session[:session_token] = nil
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
end
