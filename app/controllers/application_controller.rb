class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActionController::RoutingError, :with => :render_404

  before_filter :set_locale
  before_filter :get_tags

  def after_sign_in_path_for(resource_or_scope)
    return root_path
    # return home_page_path for user using current_user method
  end

  def after_sign_out_path_for(resource_or_scope)
    return root_path
    # return home_page_path for user using current_user method
  end

  def get_tags
    @navtags = Tag.where(:cat => 'main')
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

  def assert_valid_meta_data_edit(document, param_attributes)
    if document.published? and params[@doc_type_sym].size == 1 and not param_attributes
      flash[:notice] = "Editors cannot change the information of published documents"
      redirect_to root_path
      return false
    else
      return true
    end
  end

  def assert_valid_lang_status_edit(document, param_attributes)
    (0..3).each do |i|
      lang_attributes = param_attributes[i.to_s]
      current_lang = document.get_language(lang_attributes[:lang])
      if not valid_status_edit(current_lang, lang_attributes)
        flash[:notice] = "Editors cannot publish or unpublish documents"
        redirect_to root_path
        return
      end
    end
  end

  def valid_status_edit(lang, lang_attributes)
    d = [lang.status, lang_attributes[:status]]
    return d.count("published") != 1
  end

  def setup_new_text_fields
    if not params[:subtype]
      redirect_to new_text_choice_path
      return
    else
      @text_subtype = params[:subtype]
      @document.subtype = @subtype
      Text.send(params[:subtype]).each do |field|
        @document.subtype_fields[field] = ""
      end
    end
  end

  def set_langs
    document_langs = []
    Item::LANGUAGES.each do |l|
      document_langs.append(@document.send(@langs_sym).build(:lang => l.to_s, :status => 'new'))
      # need to also initialize the plain_text of each lang if we are dealing with a text document
      if params[:type] == "texts"
        document_langs.last.plain_text = ""
      end
    end
    return 
  end

  def set_new_status
    lang = params[@doc_type_sym][(@langs_sym.to_s + '_attributes').to_sym]
    (0..3).each do |i|
      lang[i.to_s][:status] = 'new'
    end
  end

  def return_to_from_create(document)
    if user_signed_in?
      return document
    else
      return method((document.class.to_s.downcase.pluralize + "_path").to_sym).call
    end
  end

end
