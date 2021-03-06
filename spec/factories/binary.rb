require 'faker'

FactoryGirl.define do
  factory :binary do |f|
    f.name {Faker::Lorem.words(rand(4) + 1)}
    f.binary_langs_attributes([
                               { lang: "English", title: "Title", status: "new" },
                               { lang: "French", title: "Title", status: "new" },
                               { lang: "Spanish", title: "Title", status: "new" },
                               { lang: "Creole", title: "Title", status: "new" },
                              ])
  end
end
