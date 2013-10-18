class DashboardController < ApplicationController
  
  def index
    setup_dashboard
    @title = 'Dashboard Home'
  end

  def setup_dashboard
    authenticate
    if @user == 'redirect'
      redirect_to '/login'
    else
      @flash_notice = flash[:notice]
      @links = {}
      @links['Dashboard Home']  = '/dashboard'
      @links['Published']       = '/dashboard/documents/published'
      if @user.role.to_sym == :Manager
        @links['Editor Reviewed'] = '/dashboard/documents/reviewed'
      end
      @links['In Progress']     = '/dashboard/documents/in_progress'
      @links['All Documents']   = '/dashboard/documents'
      @links['Submit Document'] = '/dashboard/documents/new'
      if @user.role.to_sym == :Manager  or @user.role.to_sym == :Tech
        @links['Manage Users']    = '/dashboard/users'
      end
    end
  end
  
  def authenticate
    if session[:uid]
      @user = User.find_by_id(session[:uid])
    else
      flash[:notice] = 'You must log in before continuing'
      @user = 'redirect'
    end
  end
  
end
