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

  describe "the published? method" do
    it "should return false if no sub_langs are published" do
      p = FactoryGirl.create(:picture)
      p.save
      p.published?.should be_false
    end
    it "should return true if all the sub_langs are published" do
      p = FactoryGirl.create(:picture)
      p.save
      p.picture_langs.each do |pl|
        pl.status = "published"
        pl.save
      end
      p.published?.should be_true
    end
    it "should run a post validation hook that sets booleans" do
      b = FactoryGirl.create(:picture)
      b.save
      b.new.should == true
      b.published.should == false
      b.pending.should == false
      b.in_progress.should == false
      b.rejected.should == false
      b.picture_langs[0].status = "published"
      b.picture_langs[1].status = "pending"
      b.picture_langs[2].status = "in_progress"
      b.picture_langs[3].status = "rejected"
      b.picture_langs[0].save
      b.picture_langs[1].save
      b.picture_langs[2].save
      b.picture_langs[3].save
      b.save
      b.new.should == false
      b.published.should == true
      b.in_progress.should == true
      b.pending.should == true
      b.rejected.should == true
    end
  end

  it {should validate_presence_of :pic}
  it {should validate_presence_of :name}
end
