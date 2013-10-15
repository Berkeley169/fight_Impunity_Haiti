require 'faker'

FactoryGirl.define do
	factory :binary_lang do |f|
		f.title { Faker::Lorem.words(rand(4) + 1) }
		f.lang "English"
		f.published true
	end
end