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
end
