require 'spec_helper'
describe DocumentsHelper do
	describe "the relevant_title_and_description method" do
		it "should return no title if there isn't one in any language" do
			t = FactoryGirl.create(:text_no_title)
			relevant_langs = ['English','French','Creole','Spanish']
			result = relevant_title_and_description(t, relevant_langs)
			result.should == ['No Title', 'No Description',nil]
		end
		it "should return the English title and description if one exists and English is the most relevant language" do 
			t = FactoryGirl.create(:text)
			tl = t.get_language(:English)
			tl.title = "foobar"
			tl.save
			relevant_langs = ['English','French','Creole','Spanish']
			result = relevant_title_and_description(t, relevant_langs)
			result[0].should == 'foobar'
		end
		it "should return the next most relevant title and description 
		if English is the most relevant language, and an English version doesn't exist" do 
			t = FactoryGirl.create(:text)
			tl = t.get_language(:English)
			tl.title = ""
			tl.save
			tl = t.get_language(:French)
			tl.title = "foobar"
			tl.save
			tl = t.get_language(:Spanish)
			tl.title = "foobar in spanish"
			tl.save
			relevant_langs = ['English','French','Creole','Spanish']
			result = relevant_title_and_description(t, relevant_langs)
			result[0].should == 'foobar'
		end
	end
end
