# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(:first_name => 'the', :last_name => 'admin', :email => 'email@domain.com', :password => 'the_admin', :password_confirmation => 'the_admin', :remember_me => false, :role => 'Manager', :lang => 'English')

text = Text.create!(:name => 'test_text', :date => Date.today, :subtype => 'book', :subtype_fields => {:title => "Dante's Inferno", :chapter => "24"})
text.text_langs_attributes = [
      { lang: "English", title: "Title", status: "new", plain_text: "content" },
      { lang: "French", title: "Title", status: "new", plain_text: "content" },
      { lang: "Creole", title: "Title", status: "new", plain_text: "content" },
      { lang: "Spanish", title: "Title", status: "new", plain_text: "content" },
    ]
text.save!