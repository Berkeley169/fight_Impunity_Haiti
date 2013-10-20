# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :editor, :class => 'user' do |e|
    e.sequence(:name)  { |n| "Eddy#{n} Top" }
    e.sequence(:email) { |n| "editor#{n}@gmail.com" }
    e.password "abcd1234"
    e.password_confirmation { |u| u.password }
    e.role "Editor"
    e.lang "English"
  end
  factory :manager, :class => 'user' do |m|
    e.sequence(:name)  { |n| "M. Anna Ger#{n}" }
    e.sequence(:email) { |n| "manager#{n}@gmail.com" }
    m.password "abcd1234"
    m.password_confirmation { |u| u.password }
    m.role "Manager"
    m.lang "English"
  end
end
