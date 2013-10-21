class DashboardController < ApplicationController

  before_filter :authenticate_user
  
  def index
    setup_dashboard
    @title = 'Dashboard Home'
  end

  def setup_dashboard
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
  
  def authenticate_user
    if user_signed_in?
      @user = current_user
    else
      flash[:notice] = 'You must log in before continuing'
      @user = 'redirect'
    end
  end
  
end
