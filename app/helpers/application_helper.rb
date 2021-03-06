module ApplicationHelper
  def get_locale
    I18n.locale
  end

  def auth_to_view(document_lang)
    user_signed_in? or document_lang.status == 'published'
  end

  def auth_to_edit_status(document_lang)
    if not user_signed_in?
      return false
    end
    if current_user.role == "Manager"
      return true
    end
    if current_user.role.downcase == "editor" and ["in_progress", "new"].include?(document_lang.status)
      return true
    end
    return false
  end

  def auth_to_edit_lang(document_lang)
    if not user_signed_in?
      return document_lang.status == "new"
    end
    if current_user.role == "Manager"
      return true
    end
    if current_user.role == "Editor"
      return (document_lang.status == "in_progress" or controller.action_name == "new")
    end
    return false
  end

  def auth_to_edit_meta(doc)
    if doc.new_document?
      return true
    end
    if current_user.role == "Manager"
      return true
    end
    if current_user.role == "Editor" and not (doc.published or doc.pending)
      return true
    end
    return false
  end

  def locale_to_word(locale = I18n.locale)
    if locale == :en
      :english
    elsif locale == :fr
      :french
    elsif locale == :es
      :spanish
    elsif locale == :ht
      :creole
    else
      :english
    end 
  end

  # TODO: change these helpers to be localized
  def pretty_date(date)
    if date.today?
      return t(:today)
    elsif date.to_date == Date.yesterday
      return t(:yesterday)
    else
      return date.strftime("%b %d, %Y")
    end
  end

  def doc_description(document)
    document.send((document.class.to_s.downcase + "_langs").to_sym).each do |dl|
      if !dl.description.nil?
        return dl.description
      end
    end
    return "No description available"
  end
  
  def doc_title(document)
    document.send((document.class.to_s.downcase + "_langs").to_sym).each do |dl|
      if !dl.title.nil?
        return dl.title
      end
    end
  end 

  def current_locale? locale, element
    get_locale == element.to_sym || locale == element
  end

  def current_locale_class(locale, element)
    return 'active' if get_locale.nil? && locale.nil? && element == 'en' || 
                       get_locale == element.to_sym ||
                       locale == element
  end

  def relevant_langs
    abrvs = ['fr','en','ht','es']
    langs = ['French','English','Creole','Spanish']
    user_lang = locale_lang = nil
    if current_user
      user_lang = current_user.lang
    end
    if session[:locale] != nil
      abrvs.each_with_index do |locale,i|
        if locale == session[:locale]
          locale_lang = langs[i]
          break
        end
      end
    end
    if user_lang != nil
      langs.delete(user_lang)
      langs.insert(0,user_lang)
    end
    if locale_lang != nil
      langs.delete(locale_lang)
      langs.insert(0,locale_lang)
    end
    return langs
  end

end
