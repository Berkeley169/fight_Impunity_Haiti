require 'faker'

FactoryGirl.define do
  factory :picture_lang do |f|
  	f.title { Faker::Lorem.words(rand(4) + 1) }
  	f.lang "English"
  	f.status "published"
  end
end
