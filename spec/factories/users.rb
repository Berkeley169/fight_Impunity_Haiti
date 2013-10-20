# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :editor, :class => 'user' do |e|
    e.name "Eddy Tor"
    e.email "editor@gmail.com"
    e.password "abcd1234"
    e.password_confirmation "abcd1234"
    e.role "Editor"
    e.lang "English"
  end
  factory :manager, :class => 'user' do |m|
    m.name "M. Anna Ger"
    m.email "manager@gmail.com"
    m.password "abcd1234"
    m.password_confirmation "abcd1234"
    m.role "Manager"
    m.lang "English"
  end
end
