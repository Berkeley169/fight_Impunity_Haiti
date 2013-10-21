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

  it {should validate_presence_of :snd}
  it {should validate_presence_of :name}

end
