require 'spec_helper'

describe Video do
	describe "the basic model" do
	  	it "should have a working factorygirl" do
	  		v = FactoryGirl.create(:video)
	  		v.should be_valid
	  	end
	  # 	it "should destory it's children on destroy" do
			# v = FactoryGirl.create(:text)
			# t.save
			# t.construct_children
			# id_num = t.id
			# t.destroy
			# TextLang.where(:text_id => id_num).should be_empty
	  # 	end

	end

	describe "the get_language method" do
	  	it "should get the correct language" do
	  			v = FactoryGirl.create(:video)
	  			v.save
	  			vl1 = FactoryGirl.create(:video_lang, :title => "English text")
	  			vl2 = FactoryGirl.create(:video_lang, :title => "French text", :lang => :French)
	  			vl1.save
	  			vl2.save
	  			v.video_langs << vl1
	  			v.video_langs << vl2
	  			v.save!
	  			v.get_language("English").lang.should == "English"
	  			v.get_language("French").lang.should == "French"  
	  			v.get_language("Creole").should_not be_nil	
	  			v.destroy		
	  	end
	end


  	describe "the get_translations method" do
  		it "successfully gets all the children" do
  			v = FactoryGirl.create(:video)
  			v.save!
  			list = v.get_translations
  			list.length.should == 4
  		end
  	end

  describe "the published? method" do
    it "should return true if one sub_lang is published" do
      p = FactoryGirl.create(:video)
      p.save
      pl = p.get_language(:English)
      pl.status = 'published'
      pl.save
      p.published?.should be_true
    end
    it "should return false if no sub_langs are published" do
      p = FactoryGirl.create(:video)
      p.save
      p.published?.should be_false
    end
    it "should return true if all the sub_langs are published" do
      p = FactoryGirl.create(:video)
      p.save
      p.video_langs.each do |pl|
        pl.status = "published"
        pl.save
      end
      p.published?.should be_true
    end
  end
end