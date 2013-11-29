When /I search "(.*)"/ do |search|
	get "/search/#{URI.escape(search)}"
end