require 'spec_helper'

describe Text do
  describe "the basic model" do
  	it "should have a working factorygirl" do
  		t = FactoryGirl.create(:text)
  		t.should be_valid
  	end

  	it "should validate the presene of author" do 
  		t = FactoryGirl.create(:text)
  		t.author = nil
  		t.should_not be_valid
  	end

  end

  	describe "the get_language method" do
  		it "should get the correct language" do
  			t = FactoryGirl.create(:text)
  			t.id = 1
  			t.save
  			tl1 = FactoryGirl.create(:text_lang, :title => "English text")
  			tl2 = FactoryGirl.create(:text_lang, :title => "French text", :lang => :French)
  			tl1.text_id = 1
  			tl2.text_id = 1
  			tl1.save
  			tl2.save
  			t.get_language("English").should == tl1
  			t.get_language("French").should == tl2  
  			t.get_language("Creole").should be_false			
  		end
  	end

  	describe "the get_translations method" do
  		it "successfully gets all the children" do
  			t = FactoryGirl.create(:text)
  			t.id = 1
  			tl1 = FactoryGirl.create(:text_lang, :title => "English text")
  			tl2 = FactoryGirl.create(:text_lang, :title => "French text")
  			tl1.text_id = 1
  			tl2.text_id = 1
  			t.save
  			tl1.save
  			tl2.save
  			list = t.get_translations
  			list.include?(tl1).should be_true
  			list.include?(tl2).should be_true
  		end
  	end
end
