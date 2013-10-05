require 'spec_helper'
include ValidModelConstructors
describe Picture do
	let(:valid_attributes) { { "name" => "MyString" } }
	let(:valid_picture_lang_attributes) { {:lang => "English"} }
  	describe "the get_translations method" do
  		it "successfully gets all the children" do
  			p = construct_valid_picture
  			p.id = 1
  			pl1 = PictureLang.create! valid_picture_lang_attributes
  			pl2 = PictureLang.create! valid_picture_lang_attributes
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
  			p = Picture.create! valid_attributes
  			p.id = 1
  			p.save
  			pl1 = PictureLang.create! valid_picture_lang_attributes
  			pl2 = PictureLang.create! valid_picture_lang_attributes
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

  		it "should workd if everything is valid" do
  			p = Picture.new(valid_attributes)
  			p.pic_file_name = "file.jpg"
  			p.should be_valid
  		end
  	end
end
