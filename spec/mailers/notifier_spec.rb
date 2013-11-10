require "spec_helper"

describe Notifier do
	it 'should send to the proper email' do
	  manager = FactoryGirl.build(:manager)
	  mail = Notifier.welcome(manager)
	  mail.to.should == [manager.email]
	end
end
