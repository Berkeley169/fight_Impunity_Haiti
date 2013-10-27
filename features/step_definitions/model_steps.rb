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
