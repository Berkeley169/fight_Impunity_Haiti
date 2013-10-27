# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :name do |n|
    "John #{n} Smith"
  end
  sequence :email do |n|
    "email#{n}@gmail.com"
  end
  factory :editor, :class => 'user' do |e|
    e.first_name "Eddy"
    e.last_name "Tor"
    e.email "editor@gmail.com"
    e.password "abcd1234"
    e.password_confirmation { |u| u.password }
    e.role "Editor"
    e.lang "English"
  end
  factory :manager, :class => 'user' do |m|
    m.first_name "M. Anna"
    m.last_name "Ger"
    m.email "manager@gmail.com"
    m.password "abcd1234"
    m.password_confirmation { |u| u.password }
    m.role "Manager"
    m.lang "English"
  end
  factory :tech, :class => 'user' do |m|
    m.first_name "Tex"
    m.last_name "Saport"
    m.email "tech@gmail.com"
    m.password "abcd1234"
    m.password_confirmation "abcd1234"
    m.role "Tech"
    m.lang "English"
  end
end
