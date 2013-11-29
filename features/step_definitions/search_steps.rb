When /I search "(.*)"/ do |search|
	visit "/search/?search=#{URI.escape(search)}"
end

Then /I should see the search button/ do
	assert page.body.match(/search/)
end