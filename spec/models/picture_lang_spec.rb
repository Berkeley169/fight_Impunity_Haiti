require 'spec_helper'

describe PictureLang do
  	describe "testing validation" do
	  	# it "should validate precense of title" do
	  	# 	pl = FactoryGirl.create(:picture_lang)
	  	# 	pl.title = nil
	  	# 	pl.should_not be_valid
	  	# end
	  	# it "should validate precense of language" do
	  	# 	pl = FactoryGirl.create(:picture_lang)
	  	# 	pl.lang = nil
	  	# 	pl.should_not be_valid
	  	# end
	  	it "should work with valid valid_attributes" do
	  		FactoryGirl.create(:picture_lang).should be_valid
	  	end
  end
end
