class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource_or_scope)
    return dashboard_path
    # return home_page_path for user using current_user method
  end

  def after_sign_out_path_for(resource_or_scope)
    return sessions_login_path
    # return home_page_path for user using current_user method
  end
  
end
