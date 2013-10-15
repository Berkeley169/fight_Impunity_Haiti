require 'spec_helper'

describe Tag do
    describe "The basic relationship" do
        it "should associate with a picture" do
            p = FactoryGirl.create(:picture)
            t = FactoryGirl.create(:tag)
            p.tags << t
            p.save!
            tags = p.tags
            tags.include?(t).should be_true
            pics = t.pictures
            pics.include?(p).should be_true
        end
    end
end
