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
	  			t.save
	  			tl1 = FactoryGirl.create(:text_lang, :title => "English text")
	  			tl2 = FactoryGirl.create(:text_lang, :title => "French text", :lang => :French)
	  			tl1.text_id = t.id
	  			tl2.text_id = t.id
	  			tl1.save
	  			tl2.save
	  			t.destroy		
	  	end
	end


  	describe "the get_translations method" do
  		it "successfully gets all the children" do
  			t = FactoryGirl.create(:text)
  			t.save
  			tl1 = FactoryGirl.create(:text_lang, :title => "English text")
  			tl2 = FactoryGirl.create(:text_lang, :title => "French text")
  			tl1.text_id = t.id
  			tl2.text_id = t.id
  			t.save
  			tl1.save
  			tl2.save
  			list = t.get_translations
  			list.include?(tl1).should be_true
  			list.include?(tl2).should be_true
  		end
  	end

  describe "the published? method" do
    it "should return true if one sub_lang is published" do
      p = FactoryGirl.create(:text)
      p.save
      pl = p.text_langs[0]
      pl.status = 'published'
      pl.save
      p.published?.should == true
    end
    it "should return false if no sub_langs are published" do
      p = FactoryGirl.create(:text)
      p.save
      p.published?.should be_false
    end
    it "should return true if all the sub_langs are published" do
      p = FactoryGirl.create(:text)
      p.save
      p.text_langs.each do |pl|
        pl.status = "published"
        pl.save
      end
      p.published?.should be_true
    end
    it "should run a post validation hook that sets status booleans" do
      statuses = ["published", "in_progress", "pending", "rejected", "new"]
      t = FactoryGirl.create(:text)
      t.save
      t.new.should == true
      t.published.should == false
      t.in_progress.should == false
      t.pending.should == false
      t.rejected.should == false
      (0..3).each do |i|
        t.text_langs[i].status = statuses[i]
        t.text_langs[i].save
      end
      t.save 
      t.published.should == true
      t.pending.should == true
      t.in_progress.should == true
      t.rejected.should == true
      t.new.should == false
    end
      
    
  end
end
