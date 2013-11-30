# MODEL GENERATION STEPS
Given /there is a picture named "(.*)"$/ do |name|
  p = FactoryGirl.create(:picture, :name => name)
  p.picture_langs.each do |pl|
    pl.title = name
    pl.save
  end
  p.save
end

Given /there is a video named "(.*)"$/ do |name|
  v = FactoryGirl.create(:video, :name => name)
  v.video_langs.each do |vl|
    vl.title = name
    vl.save
  end
  v.save
end

Given /there is a sound named "(.*)"$/ do |name|
  s = FactoryGirl.create(:sound, :name => name)
  s.sound_langs.each do |sl|
    sl.title = name
    sl.save
  end
  s.save
end

Given /there is a text named "(.*)"$/ do |name|
  t = FactoryGirl.create(:text, :name => name)
  t.text_langs.each do |tl|
    tl.title = name
    tl.save
  end
  t.save
end

Given /there is a binary named "(.*)"/ do |name|
  b = FactoryGirl.create(:binary, :name => name)
  b.binary_langs.each do |bl|
    bl.title = name
    bl.save
  end
  b.save
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

When /I set the status of the (.*) translation of the (.*) "(.*)" to "(.*)"/ do |lang, type, name, status|
  thing = type.titleize.constantize.where(:name => name).first
  lng = thing.get_language(lang.titleize.to_sym)
  lng.status = status
  lng.save
  thing.save
end

When /all the translations of the (.*) named "(.*)" are (.*)$/ do |type, name, status|
  doc = type.constantize.where(:name => name).first
  doc_langs = (type + "_langs").to_sym
  doc.send(doc_langs).each do |doc_lang|
    doc_lang.status = status
  end
  doc.save
end

Given /there is a tag with En: "(.*)" Fr: "(.*)" Cr: "(.*)" Sp: "(.*)"/ do |en, fr, cr, sp|
  t = Tag.new(:english => en, :french => fr, :creole => cr, :spanish => sp, :cat => 'main')
  t.save
end

# PERMISSIONS VIOLATIONS TESTS
When /I submit a manual POST request to create a (.*) (.*) document named "(.*)"$/ do |status, type, name|
  path_helper = "create_" + type + "_path"
  doc = FactoryGirl.create(type.to_sym)
  doc.name = name
  doc_langs = (type + "_langs").to_sym
  doc.send(doc_langs).each do |doc_lang|
    doc_lang.status = status
    doc_lang.save
  end
  post(send(path_helper), type.to_sym => doc.attributes)
end

Then /the (.*) document named "(.*)" should not exist$/ do |type, name|
  type.constantize.where(:name => name).count.should == 0
end

When /I submit a manual POST request to edit a (.*) named "(.*)"$/ do |type, name|
  doc = type.constantize.where(:name => name).first
  doc.name = doc.name + " EDITTED"
  path_helper = "update_" + type + "path"
  post(send(path_helper), doc.attributes)
end

When /I submit a manual POST request to mark a (.*) named "(.*)" as (.*)$/ do |type, name, status|
  doc = type.constantize.where(:name => name).first
  path_helper = "update_" + type + "_path".to_sym
  doc_langs_attributes = type + "_langs_attributes".to_sym
  post(send(path_helper), type.to_sym => { doc_langs_attribute => [
                            {:id => 1, :status => status},
                            {:id => 2, :status => status},
                            {:id => 3, :status => stauts},
                            {:id => 4, :status => status}
                          ]
                        }
                      )
end

