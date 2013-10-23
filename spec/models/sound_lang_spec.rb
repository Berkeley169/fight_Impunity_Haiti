require 'spec_helper'

describe SoundLang do
  describe "validation" do
    it "should recognize valid sound_langs" do
      FactoryGirl.create(:sound_lang).should be_valid
    end
  end
end
