require 'spec_helper'

describe BinaryLang do
  	describe "testing validation" do
	  	it "should work with valid valid_attributes" do
	  		FactoryGirl.create(:binary_lang).should be_valid
	  	end
	  end
end
