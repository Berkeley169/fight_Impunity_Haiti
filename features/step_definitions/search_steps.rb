When /I search "(.*)"/ do |search|
	visit "/search/#{URI.escape(search)}"
end