module ApplicationHelper
	def get_locale
		I18n.locale
	end

	def locale_to_word(locale = I18n.locale)
		if locale == :en
			:English
		elsif locale == :fr
			:French
		elsif locale == :es
			:Spanish
		elsif locale == :ht
			:Creole
		else
			:English
		end	
	end
end
