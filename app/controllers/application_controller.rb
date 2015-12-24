class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?, :ensure_signed_in, :ensure_signed_out

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def sign_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def sign_out!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def signed_in?
    !!current_user
  end

  def ensure_signed_in
    unless signed_in?
      flash[:errors] = ["Must be signed in."]
      redirect_to cats_url
    end
  end

  def ensure_signed_out
    if signed_in?
      flash[:errors] = ["Already logged in."]
      redirect_to cats_url
    end
  end

end
