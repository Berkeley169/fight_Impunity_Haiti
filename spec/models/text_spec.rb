require 'spec_helper'

describe Text do
	describe "the basic model" do
	  	it "should have a working factorygirl" do
	  		t = FactoryGirl.create(:text)
	  		t.should be_valid
	  	end
	  	it "should destory it's children on destroy" do
			t = FactoryGirl.create(:text)
			t.save
			t.construct_children
			id_num = t.id
			t.destroy
			TextLang.where(:text_id => id_num).should be_empty
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
	  			t.get_language("Creole").should be_nil
	  			t.get_language("Spanish").should be_false	
	  			t.destroy		
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

  describe "the published? method" do
    # it "should return true if one sub_lang is published" do
    #   p = FactoryGirl.create(:text)
    #   p.save
    #   pl = p.get_language(:English)
    #   pl.status = 'published'
    #   pl.save
    #   p.published?.should be_true
    # end
    it "should return false if no sub_langs are published" do
      p = FactoryGirl.create(:text)
      p.save
      p.published?.should be_false
    end
    # it "should return true if all the sub_langs are published" do
    #   p = FactoryGirl.create(:text)
    #   p.save
    #   p.text_langs.each do |pl|
    #     pl.status = "published"
    #     pl.save
    #   end
    #   p.published?.should be_true
    # end
  end
end
