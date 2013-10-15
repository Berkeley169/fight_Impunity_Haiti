require 'spec_helper'

describe Binary do
  describe "the get_translations method" do
  	it "successfully gets all the children" do
  		p = FactoryGirl.create(:binary)
  		p.id = 1
  		p.save
  		list = p.binary_langs
      	list.count.should == 4
      	list.first.binary_id.should == p.id
      	list.last.binary_id.should == p.id
  	end            
  end

  describe "the get_language method" do
  	it "should get the correct language" do
  		p = FactoryGirl.create(:binary)
  		p.id = 1
  		p.save
      	p.get_language("English").lang.should == "English"
      	p.get_language("French").lang.should == "French"	
  	end
  end

  describe "validating the correct format" do
  	it "should require a title" do
      p = FactoryGirl.create(:binary)
      p.title = nil
      p.should_not be_valid
  	end

    it "should work if everything is valid" do
      p = FactoryGirl.create(:binary)
      p.should be_valid
    end

  end
end
