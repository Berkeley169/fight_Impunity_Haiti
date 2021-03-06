require 'faker'

FactoryGirl.define do
  factory :video do |f|
    f.name {Faker::Lorem.words(rand(4) + 1)}
    f.date Date.today
    # VideoID of Rebecca Black's Friday
    f.vid "http://www.youtube.com/watch?v=kfVsfOSbJY0"
    # auto create VideoLangs
    f.video_langs_attributes([
      {lang: "English", title: "Title", status: "new"},
      {lang: "French", title: "Title", status: "new"},
      {lang: "Spanish", title: "Title", status: "new"},
      {lang: "Creole", title: "Title", status: "new"},
    ])
  end
end
