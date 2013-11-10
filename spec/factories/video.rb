require 'faker'

FactoryGirl.define do
  factory :video do |f|
    f.name {Faker::Lorem.words(rand(4) + 1)}
    f.date Date.today
    f.vid File.new(Rails.root + 'spec/fixtures/videos/url.txt')
    # auto create VideoLangs
    f.video_langs_attributes([
      {lang: "English", title: "Title", status: "new"},
      {lang: "French", title: "Title", status: "new"},
      {lang: "Spanish", title: "Title", status: "new"},
      {lang: "Creole", title: "Title", status: "new"},
    ])
  end
end
