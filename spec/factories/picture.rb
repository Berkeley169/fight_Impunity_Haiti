require 'faker'

FactoryGirl.define do
  factory :picture do |f|
  	f.name { Faker::Lorem.words(rand(4) + 1) }
  	f.date Date.today
  	f.pic File.new(Rails.root + 'spec/fixtures/images/trollface.jpeg')
    # auto-create PictureLangs
    f.picture_langs_attributes([
      { lang: "English", title: "Title", status: "new" },
      { lang: "French", title: "Title", status: "new" },
      { lang: "Spanish", title: "Title", status: "new" },
      { lang: "Creole", title: "Title", status: "new" },
    ])
  end
end
