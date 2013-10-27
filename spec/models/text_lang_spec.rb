require 'spec_helper'

describe TextLang do
    describe "testing validation" do
	  	# it "should validate precense of title" do
	  	# 	tl = FactoryGirl.create(:text_lang)
	  	# 	tl.title = nil
	  	# 	tl.should_not be_valid
	  	# end
	  	it "should work with valid valid_attributes" do
	  		FactoryGirl.create(:text_lang).should be_valid
	  	end
  	end

  	it {should validate_presence_of :lang}
end
