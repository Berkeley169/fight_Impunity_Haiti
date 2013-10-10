require 'faker'

FactoryGirl.define do
  factory :binary do |f|
  	f.title { Faker::Lorem.words(rand(4) + 1) }
  	f.binary_langs_attributes([
      { lang: "English", title: "Title" },
      { lang: "French", title: "Title" },
      { lang: "Spanish", title: "Title" },
      { lang: "Creole", title: "Title" },
    ])
  end
end