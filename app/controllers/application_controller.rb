class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource_or_scope)
    return dashboard_path
    # return home_page_path for user using current_user method
  end

  def after_sign_out_path_for(resource_or_scope)
    return root_path
    # return home_page_path for user using current_user method
  end

  def authenticate_user
    if user_signed_in?
      @user = current_user
    else
      flash[:notice] = 'You must log in before continuing'
      @user = 'redirect'
      redirect_to new_user_session_path
    end
  end

  def authenticate_manager
    if not user_signed_in?
      flash[:notice] = 'You must log in as a manager to do that'
      redirect_to new_user_session_path
    elsif not current_user.role == "Manager"
      flash[:notice] = 'You must be a site manager to do that'
      redirect_to dashboard_path
    else
      @user = current_user
    end
  end
end
