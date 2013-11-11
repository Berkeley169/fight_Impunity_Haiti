require 'spec_helper'

describe Sound do
  describe "the get_translations method" do
    it "successfully gets all the children" do
      s = FactoryGirl.create(:sound)
      s.save
      sound_langs = s.sound_langs
      sound_langs.first.sound_id.should == s.id
      sound_langs.last.sound_id.should == s.id
    end
  end

  describe "the get language method" do
    it "should get the correct language" do
      s = FactoryGirl.create(:sound)
      s.save
      s.get_language("English").lang.should == "English"
      s.get_language("French").lang.should == "French"
    end
  end

  describe "validating the correct format" do
    it "should be valid if everything is valid" do
      s = FactoryGirl.create(:sound)
      s.should be_valid
    end

    it "should require the file to be a valid audio format" do
      expect{FactoryGirl.create(:sound,
        :snd => File.new(Rails.root + 'spec/fixtures/documents/Lorem_ipsum.pdf'))}.to raise_error
    end
  end

  describe "the published? method" do
    it "should return false if no sub_langs are published" do
      p = FactoryGirl.create(:sound)
      p.save
      p.published?.should be_false
    end
    it "should return true if all the sub_langs are published" do
      p = FactoryGirl.create(:sound)
      p.save
      p.sound_langs.each do |pl|
        pl.status = "published"
        pl.save
      end
      p.published?.should be_true
    end
    it "should run a post validation hook that sets status booleans" do
      statuses = ["published", "in_progress", "pending", "rejected", "new"]
      t = FactoryGirl.create(:sound)
      t.save
      t.new.should == true
      t.published.should == false
      t.pending.should == false
      t.in_progress.should == false
      t.rejected.should == false
      (0..3).each do |i|
        t.sound_langs[i].status = statuses[i]
        t.sound_langs[i].save
      end
      t.save 
      t.published.should == true
      t.pending.should == true
      t.in_progress.should == true
      t.rejected.should == true
      t.new.should == false
    end

  end

  it {should validate_presence_of :snd}
  it {should validate_presence_of :name}

end
