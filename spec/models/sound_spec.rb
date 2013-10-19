require 'spec_helper'

describe Sound do
  pending "add some examples to (or delete) #{__FILE__}"
  describe "the get_translations method" do
    it "successfully gets all the children" do
      s = FactoryGirl.create(:sound)
      s.save
      sound_langs = s.sound_langs
      sound_langs.first.picture_id.should == p.id
      sound_langs.last.picture_id.should == p.id
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
      s.should_be valid
    end

    it "should require a name" do
      s = FactoryGirl.create(:sound)
      s.should_be valid
      s.name = nil
      s.should_not be_valid
    end

    it "should require a pic attachment" do
      p = FactoryGirl.create(:sound)
      s.should_be valid
      s.snd = nil
      s.should_not be_valid
    end

    it "should require the file to be a valid audio format" do
      expect{FactoryGirl.create(:sound,
        :snd => File.new(Rails.root + 'spec/fixtures/pictures/Lorem_ipsum.pdf'))}.to raise error
    end
  end

end
