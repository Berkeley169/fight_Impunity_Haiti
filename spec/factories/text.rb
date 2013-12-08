require 'faker'

FactoryGirl.define do
  factory :text do |f|
  	f.name { Faker::Lorem.words(rand(4) + 1) }
  	f.date Date.today
    f.subtype "book"
    f.subtype_fields {{:title => "Dante's Inferno", :chapter => "24"}}
    f.text_langs_attributes([
      { lang: "English", title: "Title", status: "new", plain_text: "content" },
      { lang: "French", title: "Title", status: "new", plain_text: "content" },
      { lang: "Creole", title: "Title", status: "new", plain_text: "content" },
      { lang: "Spanish", title: "Title", status: "new", plain_text: "content" },
    ])
  end
  factory :text_no_title, :class => 'text' do |f|
    f.name { Faker::Lorem.words(rand(4) + 1) }
    f.date Date.today
    f.subtype "book"
    f.subtype_fields {{:title => "Dante's Inferno", :chapter => "24"}}
    f.text_langs_attributes([
      { lang: "English", title: "", status: "new", plain_text: "content" },
      { lang: "French", title: "", status: "new", plain_text: "content" },
      { lang: "Creole", title: "", status: "new", plain_text: "content" },
      { lang: "Spanish", title: "", status: "new", plain_text: "content" },
    ])
  end
end
