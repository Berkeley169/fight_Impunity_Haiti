module DocumentsHelper
	# this array encodes language display preferences

	def relevant_title_and_description(item,lang_prefs)
		lang_prefs.each do |lang|
			item_lang = item.get_language(lang)
			if valid(item_lang)
				return [item_lang.title,item_lang.description]
			end
		end
		return ['No Title', 'No Description']
	end

	def valid(item_lang)
		if item_lang.title.length > 0
			return true
		end
		return false
	end
end
