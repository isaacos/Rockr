class SessionsController < ApplicationController


  def new
  end

  def create
    params.require(:session).permit(:username)
    render '/login'
  end

  def destroy
    session.delete :name
  end

  private
  def session_params
    params.require(:session).permit(:username)
  end
end
