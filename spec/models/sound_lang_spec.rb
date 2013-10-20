require 'spec_helper'

describe SoundLang do
  pending "add some examples to (or delete) #{__FILE__}"
  describe "validation" do
    it "should recognize valid picture_langs" do
      FactoryGirl.reate(:picture_lnag).should be_valid
    end
  end
end
