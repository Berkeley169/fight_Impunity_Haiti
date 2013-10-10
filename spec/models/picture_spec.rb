require 'spec_helper'
include ValidModelConstructors
describe Picture do
	let(:valid_attributes) { { "name" => "MyString" } }
	let(:valid_picture_lang_attributes) { {:lang => "English"} }
  	describe "the get_translations method" do
  		it "successfully gets all the children" do
  			p = FactoryGirl.create(:picture)
  			p.id = 1
  			p.save
  			list = p.picture_langs
        list.count.should == 4
        list.first.picture_id.should == p.id
        list.last.picture_id.should == p.id
  		end
  	end

  	describe "the get_language method" do
  		it "should get the correct language" do
  			p = FactoryGirl.create(:picture)
  			p.id = 1
  			p.save
  			#pl1 = FactoryGirl.create(:picture_lang, :title => "English pic")
  			#pl2 = FactoryGirl.create(:picture_lang, :title => "French pic", :lang => :French)
  			#pl1.picture_id = 1
  			#pl2.picture_id = 1
  			#pl1.save
  			#pl2.save
  			p.get_language("English").lang.should == "English"
  			p.get_language("French").lang.should == "French"	
  		end
  	end

  	describe "validating the correct format" do
  		it "should require a name" do
        p = FactoryGirl.create(:picture)
        p.name = nil
  			p.should_not be_valid
  		end

  		it "should require a pic attachment" do
        p = FactoryGirl.create(:picture)
        p.pic = nil
        p.should_not be_valid
  		end

  		it "should work if everything is valid" do
        p = FactoryGirl.create(:picture)
  			p.should be_valid
  		end

      it "; the file should be a picture" do
        p = construct_invalid_picture # uses a PDF, not a picture
        p.should_not be_valid
      end
  	end
end
