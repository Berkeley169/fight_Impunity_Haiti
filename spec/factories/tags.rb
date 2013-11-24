# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    english { Faker::Lorem.words(rand(4) + 1) }
    french { Faker::Lorem.words(rand(4) + 1) }
    creole { Faker::Lorem.words(rand(4) + 1) }
    spanish { Faker::Lorem.words(rand(4) + 1) }
    cat "misc"
  end
end
