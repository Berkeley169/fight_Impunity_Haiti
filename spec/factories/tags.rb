# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    english "English Tag"
    french "French Tag"
    creole "Creole Tag"
    spanish "Spanish Tag"
    kind "misc"
  end
end
