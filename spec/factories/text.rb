require 'faker'

FactoryGirl.define do
  factory :text do |f|
  	f.name { Faker::Lorem.words(rand(4) + 1) }
  	f.date Date.today
  	f.author { Faker::Lorem.words(rand(4) + 1) }
  end
end