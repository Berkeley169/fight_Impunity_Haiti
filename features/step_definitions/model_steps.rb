# MODEL GENERATION STEPS
Given /there is a picture named "(.*)"$/ do |name|
  p = FactoryGirl.create(:picture, :name => name)
  p.save
end

Given /there is a video named "(.*)"$/ do |name|
  v = FactoryGirl.create(:video, :name => name)
end

Given /there is a sound named "(.*)"$/ do |name|
  s = FactoryGirl.create(:sound, :name => name)
end

Given /there is a text named "(.*)"$/ do |name|
  t = FactoryGirl.create(:text, :name => name)
end

Given /there is a binary named "(.*)"/ do |name|
  b = FactoryGirl.create(:binary, :name => name)
end

Given /there is a tag named "(.*)"/ do |name|
  tag = FactoryGirl.create(:tag, :english => name)
end

Given /there is a web article text named "(.*)"/ do |name|
  wt = FactoryGirl.create(:text, :subtype => "web", :name => name,
                          :subtype_fields => {:website => "SkyNet is Real",
                                              :url => "42"})
end

Given /there is a newspaper article text named "(.*)"/ do |name|
  npt = FactoryGirl.create(:text, :subtype => "newspaper", :name => name,
                           :subtype_fields => {:newspaper => "New York Times"})
end

Given /there is a journal article text named "(.*)"/ do |name|
  jt = FactoryGirl.create(:text, :subtype => "journal", :name => name,
                           :subtype_fields => {:journal => "Science",
                                               :volume => "XI"})
end

Given /there is a book excerpt text named "(.*)"/ do |name|
  jt = FactoryGirl.create(:text, :subtype => "book", :name => name,
                           :subtype_fields => {:title => "Fear and Loathing",
                                               :chapter => "24"})
end

# MODEL ATTRIBUTE CHECK STEPS
Then /text "(.*)" should be of type "(.*)"/ do |name, subtype|
  t = Text.where(:name => name).first
  t.subtype.should == subtype
end
