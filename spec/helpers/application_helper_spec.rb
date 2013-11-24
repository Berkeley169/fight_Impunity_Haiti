require 'spec_helper'

describe ApplicationHelper do
	before(:each) do
		@a = FactoryGirl.create(:text)
	end
	describe "get_locale" do
		it "should return the default locale if none is set" do
			I18n.locale = :en
			get_locale.should == :en
		end
		it "should return the correct locale when it is not the default" do
			I18n.locale = :fr
			get_locale.should == :fr
			I18n.locale = :es
			get_locale.should == :es
			I18n.locale = :ht
			get_locale.should == :ht
		end
	end

	describe "locale_to_word" do
		it "should return the correct word based on the locale" do
			I18n.locale = :en
			locale_to_word.should == :english
			I18n.locale = :fr
			locale_to_word.should == :french
			I18n.locale = :es
			locale_to_word.should == :spanish
			I18n.locale = :ht
			locale_to_word.should == :creole
		end
		it "should return the correct word based on the locale when a locale is passed in" do
			locale_to_word(:en).should == :english
			locale_to_word(:fr).should == :french
			locale_to_word(:es).should == :spanish
			locale_to_word(:ht).should == :creole
		end

		it "should work when the else statement happens and send you to English" do
			locale_to_word(:foobar).should == :english
		end
	end

	describe "current_locale?" do
		it "should work" do
			I18n.locale = :en
			current_locale?(get_locale, :en).should be_true
		end
	end

	describe "current_locale_class" do
		it "should work" do
			I18n.locale = :en
			current_locale_class(get_locale, :en).should == "active"
		end
	end

	#describe "pretty_date" do
	#	it "should work for today" do
	#		I18n.locale = :en
	#		pretty_date(:today).should be(t(:today))
	#	end
	#end

	describe "doc_description" do
		it "should work if there is no description" do
			doc_description(@a).should == "No description available"
		end
		it "should work if there is a description" do
			@a.send((@a.class.to_s.downcase + "_langs").to_sym).each do |doc|
				doc.description = "ay"
			end
			doc_description(@a).should == "ay"
		end
	end

	describe "doc_title" do
		it "should return the title" do
			@a.send((@a.class.to_s.downcase + "_langs").to_sym).each do |doc|
				doc.title = "woo"
			end
			doc_title(@a).should == "woo"
		end
	end
end

