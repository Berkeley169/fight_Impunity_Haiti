Then /the "(.*)" tag with id "(.*)" should be rendered/ do |field, id|
	# then the "textarea" field with id "text_text_langs_attributes_0_plain_text" should be rendered
	page.has_xpath?("//#{field}[@id=#{id}]")
end

When /I edit the "(.*)" id within "(.*)" with "(.*)"/ do |id, tag, value|
	#target = page.find(:xpath, "//#{tag}[@id=#{id}]")
	within("#{id}") do
		fill_in "Plain text", :with => value
	end
end

#And I edit the "text_text_langs_attributes_0_plain_text" id within "textarea" with "Testing textarea"
#Then the "plain_text" field should contain "Testing textarea"