require 'spec_helper'

describe Item do
  describe "some basic function tests:" do
  	it "should be able to get the languages" do
  		Item::LANGUAGES.sort.should == [:English, :French, :Creole, :Spanish].sort
  	end
  	it "should be able to get the statuses" do
  		Item::STATUSES.sort.should ==  [:new, :pending, :in_progress, :published, :rejected].sort
  	end
  end
end
