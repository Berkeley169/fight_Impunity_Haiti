module DocumentsHelper
	# this array encodes language display preferences

	def relevant_title(item,lang_prefs)
		lang_prefs.each do |lang|
			item_lang = item.get_language(lang)
			if valid(item_lang)
				return item_lang.title
			end
		end
		return 'No Title'
	end

	def valid(item_lang)
		if item_lang.title.length > 0
			return true
		end
		return false
	end
end
