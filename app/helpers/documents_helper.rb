module DocumentsHelper

	LANGS = ['French','English','Creole','Spanish'] 
	# this array encodes language display preferences

	def relevant_title(item,user)
		if user != nil
			item_lang = item.get_language(user.lang)
			if item_lang.title.length > 0
				return item_lang.title
			end
		end
		LANGS.each do |lang|
			item_lang = item.get_language(lang)
			if item_lang.status == 'published' or user != nil
				if item_lang.title.length > 0
					return item_lang.title
				end
			end
		end
		return 'No Title'
	end
end
