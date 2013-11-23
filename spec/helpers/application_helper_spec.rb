require 'spec_helper'

describe ApplicationHelper do
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
end
