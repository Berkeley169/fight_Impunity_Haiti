require 'spec_helper'

describe PictureLang do
	let(:valid_attributes) { { "title" => "MyTitle", "description" => "This is my description", "lang" => "English" } }
  	describe "testing validation" do
	  	it "should validate precense of title" do
	  		v = valid_attributes
	  		v[:title] = nil
	  		PictureLang.new(v).should_not be_valid
	  	end
	  	it "should validate precense of language" do
	  		v = valid_attributes
	  		v[:lang] = nil
	  		PictureLang.new(v).should_not be_valid
	  	end
  end
end
