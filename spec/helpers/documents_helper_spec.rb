require 'spec_helper'
describe DocumentsHelper do
	describe "the relevant_title_and_description method" do
		it "should return no title if there is nothing published" do
			t = FactoryGirl.create(:text)
			result = relevant_title_and_description(t, nil)
			result.should == ['No Title', 'No Description']
		end
		it "should return the correct information if there is a title but no user" do 
			t = FactoryGirl.create(:text)
			tl = t.get_language(:English)
			tl.status = "published"
			tl.title = "foobar"
			tl.save
			result = relevant_title_and_description(t, nil)
			result[0].should == 'foobar'
		end
	end
end
