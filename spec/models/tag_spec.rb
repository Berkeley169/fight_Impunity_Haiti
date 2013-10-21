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

    describe "A tag relationship" do
        it "should have a parent" do
            parent_tag = FactoryGirl.create(:tag, :english => "Parent tag")
            parent_tag.save!
            child_tag = FactoryGirl.create(:tag, :english => "child_tag")
            child_tag.save!
            child_tag.parent = parent_tag
            child_tag.parent.should == parent_tag
        end

        it "should have children" do
            parent_tag = FactoryGirl.create(:tag, :english => "Parent tag")
            parent_tag.save!
            child_tag = FactoryGirl.create(:tag, :english => "child_tag")
            child_tag.save!
            child_tag2 = FactoryGirl.create(:tag)
            child_tag2.save!
            parent_tag.children << child_tag
            parent_tag.children << child_tag2
            children = parent_tag.children
            children.should include(child_tag)
            children.should include(child_tag2)
        end
    end

    it { should validate_presence_of :kind}
end
