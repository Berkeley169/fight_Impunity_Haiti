require 'faker'

FactoryGirl.define do
  factory :picture do |f|
  	f.name { Faker::Lorem.words(rand(4) + 1) }
  	f.date Date.today
  	after(:build) do |picture|
  		pic = File.new(Rails.root + 'spec/fixtures/images/trollface.jpeg')
  	end
  end
end