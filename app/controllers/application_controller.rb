class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActionController::RoutingError, :with => :render_404

  before_filter :set_locale
  def after_sign_in_path_for(resource_or_scope)
    return root_path
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
      redirect_to root_path
    else
      @user = current_user
    end
  end

  def permissions
    if not user_signed_in?
      nil
    else
      current_user.role
    end
  end

  def set_locale
    if params[:locale]
      I18n.locale = params[:locale] || I18n.default_locale
      session[:locale] = params[:locale]
    elsif session[:locale]
      I18n.locale = session[:locale] || I18n.default_locale
    elsif current_user
      langs = {'French'=>'fr','English'=>'en','Creole'=>'ht','Spanish'=>'es'} 
      I18n.locale = langs[current_user.lang] || I18n.default_locale
    else
      I18n.locale = params[:locale] || I18n.default_locale
    end
    
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def render_404
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end
