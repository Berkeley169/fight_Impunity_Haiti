class DashboardController < ApplicationController
  
  def index
    get_links
    @title = 'Dashboard Home'
  end

  def get_links
    @links = {}
    @links['Dashboard Home']  = '/dashboard'
    @links['Published']       = '/dashboard/documents#published'
    @links['Editor Reviewed'] = '/dashboard/documents#reviewed'
    @links['In Progress']     = '/dashboard/documents#in_progress'
    @links['All Documents']   = '/dashboard/documents#all'
    @links['Submit Document'] = '/dashboard/documents#new'
    @links['Manage Users']    = '/dashboard/users'
  end
end
