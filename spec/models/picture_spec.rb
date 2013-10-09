require 'spec_helper'
include ValidModelConstructors
describe Picture do
	let(:valid_attributes) { { "name" => "MyString" } }
	let(:valid_picture_lang_attributes) { {:lang => "English"} }
  	describe "the get_translations method" do
  		it "successfully gets all the children" do
  			p = FactoryGirl.create(:picture)
  			p.id = 1
  			pl1 = FactoryGirl.create(:picture_lang, :title => "English pic")
  			pl2 = FactoryGirl.create(:picture_lang, :title => "French pic")
  			pl1.picture_id = 1
  			pl2.picture_id = 1
  			p.save
  			pl1.save
  			pl2.save
  			list = p.get_translations
  			list.include?(pl1).should be_true
  			list.include?(pl2).should be_true
  		end
  	end

  	describe "the get_language method" do
  		it "should get the correct language" do
  			p = construct_valid_picture
  			p.id = 1
  			p.save
  			pl1 = construct_valid_picture_lang("pic english")
  			pl2 = construct_valid_picture_lang("pic french")
  			pl1.picture_id = 1
  			pl2.picture_id = 1
  			pl2.lang = :French
  			pl1.save
  			pl2.save
  			p.get_language("English").should == pl1
  			p.get_language("French").should == pl2  			
  		end
  	end

  	describe "validating the correct format" do
  		it "should require a name" do
  			v = valid_attributes
  			v[:name] = nil
  			p = Picture.new(v)
  			p.pic_file_name = "file.jpg"
  			p.should_not be_valid
  		end

  		it "should require a pic attachment" do
  			v = valid_attributes
  			Picture.new(v).should_not be_valid
  		end

  		it "should work if everything is valid" do
  			p = Picture.new(valid_attributes)
  			p.pic_file_name = "file.jpg"
  			p.should be_valid
  		end

        it "; the file should be a picture" do
          p = construct_invalid_picture # uses a PDF, not a picture
          p.should_not be_valid
        end
  	end
end
