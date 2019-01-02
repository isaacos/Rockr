class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    @musician = Musician.find_by(name: params[:username])
    if @musician
      session[:musician_id] = @musician.id
      redirect_to musician_path(@musician)
    else
      flash[:notice] = "No Username"
      redirect_to login_path
    end
  end

  def destroy
    session.delete :musician_id
    redirect_to login_path
  end

  private
  def session_params
    params.require(:session).permit(:username)
  end
end
