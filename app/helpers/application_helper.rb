module ApplicationHelper
	def get_locale
		I18n.locale
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

  def auth_to_view(document_lang)
    user_signed_in? or document_lang.status == 'published'
  end

  def auth_to_edit_status(document_lang)
    if not user_signed_in?
      return false
    end
    if current_user.role == "Manager"
      return true
    elsif current_user.role == "Editor" and ["in_progress", "new"].include?(document_lang.status)
      return true
    else
      return false
    end
  end

  def auth_to_edit_lang(document_lang)
    if not user_signed_in?
      return false
    end
    if current_user.role == "Manager"
      return true
    elsif current_user.role == "Editor" and document_lang.status == "in_progress"
      return true
    else
      return false
    end
  end

  def auth_to_edit_meta(document)
    if not user_signed_in?
      return false
    end
    if current_user.role == "Manager"
      return true
    elsif current_user.role == "Editor" and not (document.published or document.pending)
      return true
    else
      return false
    end
  end
end
