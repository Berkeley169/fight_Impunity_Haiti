class SessionsController < ApplicationController

  def login
    if params[:login]
      user =  User.find_by_username(params[:login][:username])
      if user
        session[:uid] = user.id
        redirect_to dashboard_path
      else
        @message = 'login failed'
      end
    else
      @message = flash[:notice]
    end
  end

  def sign_out
    if session[:uid]
      flash[:notice] = "Signed out #{User.find(session[:uid]).username}"
      session.delete(:uid)
    end
    redirect_to '/login'
  end
end
