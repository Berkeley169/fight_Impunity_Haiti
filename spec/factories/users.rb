# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :name do |n|
    "John #{n} Smith"
  end
  sequence :email do |n|
    "email#{n}@gmail.com"
  end
  factory :editor, :class => 'user' do |e|
    e.email
    e.name
    e.password "abcd1234"
    e.password_confirmation { |u| u.password }
    e.role "Editor"
    e.lang "English"
  end
  factory :manager, :class => 'user' do |m|
    m.email
    m.name
    m.password "abcd1234"
    m.password_confirmation { |u| u.password }
    m.role "Manager"
    m.lang "English"
  end
end
