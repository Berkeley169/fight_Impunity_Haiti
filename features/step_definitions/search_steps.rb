When /I search "(.*)"/ do |search|
	get "/search?=#{search}"
end