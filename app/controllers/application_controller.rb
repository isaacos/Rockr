class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorized

  def current_musician
    Musician.find_by(id: session[:musician_id])
  end

  def logged_in?
    !!current_musician
  end

  def authorized
    redirect_to login_path unless logged_in?
  end
end
