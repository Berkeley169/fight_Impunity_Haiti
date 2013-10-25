class DashboardController < ApplicationController

  before_filter :setup_dashboard
  
  def index
    @title = 'Dashboard Home'
  end

  def setup_dashboard
    @user = authenticate_user
    if not @user.is_a? User
      redirect_to sessions_login_path
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
  
  def authenticate_user
    if user_signed_in?
      return current_user
    else
      flash[:notice] = 'You must log in before continuing'
      return 'redirect'
    end
  end
  
end
