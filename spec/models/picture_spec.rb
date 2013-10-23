require 'spec_helper'
describe Picture do
  describe "the get_translations method" do
  	it "successfully gets all the children" do
  		p = FactoryGirl.create(:picture)
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
  		p.save
      p.get_language("English").lang.should == "English"
      p.get_language("French").lang.should == "French"	
  	end
  end

  describe "validating the correct format" do
    it "should work if everything is valid" do
      p = FactoryGirl.create(:picture)
      p.should be_valid
    end

    it "should require the file to be a picture" do
      expect{FactoryGirl.create(:picture,
        :pic => File.new(Rails.root + 'spec/fixtures/documents/Lorem_ipsum.pdf'))}.to raise_error
    end
  end

  it {should validate_presence_of :pic}
  it {should validate_presence_of :name}

end
