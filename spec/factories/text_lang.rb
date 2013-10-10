require 'faker'

FactoryGirl.define do
  factory :text_lang do |f|
  	f.title { Faker::Lorem.words(rand(4) + 1) }
  	f.lang "English"
  	f.published true
  	f.txt File.new(Rails.root + 'spec/fixtures/documents/Lorem_ipsum.pdf') 
  end
end