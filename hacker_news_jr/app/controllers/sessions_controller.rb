class SessionsController < ApplicationController

  def new
    @user = User.new
    render template: "sessions/new", layout: false
  end

  def create
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end

  end

  def destroy
    session[:user_id] = nil
    # session.delete(:user_id) <-- delete the key entirely
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
