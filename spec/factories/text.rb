require 'faker'

FactoryGirl.define do
  factory :text do |f|
  	f.name { Faker::Lorem.words(rand(4) + 1) }
  	f.date Date.today
    f.subtype "book"
    f.subtype_fields {{:title => "Dante's Inferno", :chapter => "24"}}
  end
end
