require 'spec_helper'

describe User do
  it {should validate_presence_of :password}
  it {should validate_presence_of :role}
  it {should validate_presence_of :first_name}
  it {should validate_presence_of :last_name}
  describe "when setting language" do
    it "should raise an error if language is set to anything but English or French" do
      manager = FactoryGirl.build(:manager, :lang => "Latin")
      manager.valid?
      manager.errors.messages[:lang].should == ["must be either: English or French"]
    end
  end

  describe "when setting role" do
    it "should raise an error if role is set to anything but Manager, Editor, or Tech" do
      manager = FactoryGirl.build(:manager, :role => "Newb")
      manager.valid?
      manager.errors.messages[:role].should == ["must be either: Manager, Editor, or Tech"]
    end
  end
  describe "for managers" do
    before :each do
      @manager = FactoryGirl.build(:manager)
    end
    it "should be valid when created" do
      @manager.valid?.should == true
    end
    it "should be valid when first name is changed" do
      @manager.first_name = "killmoney"
      @manager.valid?.should == true
    end
    it "should be valid when last name is changed" do
      @manager.last_name = "killmoney"
      @manager.valid?.should == true
    end
    it "should be valid when lang is changed" do
      @manager.lang = "French"
      @manager.valid?.should == true
    end
    it "should be valid when role is changed" do
      @manager.role = "Editor"
      @manager.valid?.should == true
    end
    it "should be invalid when password is changed" do
      @manager.password = "asdf"
      @manager.valid?.should == false
    end
    it "should be invalid when password_confirmation is changed" do
      @manager.password_confirmation = "asdf"
      @manager.valid?.should == false
    end
    it "should be valid when email is changed" do
      @manager.email = "ryankillory@gmail.com"
      @manager.valid?.should == true
    end
  end
  describe "for editors" do
    before :each do
      @editor = FactoryGirl.build(:editor)
    end
    it "should be valid when created" do
      @editor.valid?.should == true
    end
    it "should be valid when first name is changed" do
      @editor.first_name = "killmoney"
      @editor.valid?.should == true
    end
    it "should be valid when last name is changed" do
      @editor.last_name = "killmoney"
      @editor.valid?.should == true
    end
    it "should be valid when lang is changed" do
      @editor.lang = "French"
      @editor.valid?.should == true
    end
    it "should be valid when role is changed" do
      @editor.role = "Manager"
      @editor.valid?.should == true
    end
    it "should be invalid when password is changed" do
      @editor.password = "asdf"
      @editor.valid?.should == false
    end
    it "should be invalid when password_confirmation is changed" do
      @editor.password_confirmation = "asdf"
      @editor.valid?.should == false
    end
    it "should be valid when email is changed" do
      @editor.valid?.should == true
    end
  end
  it {should validate_presence_of :email}
end
