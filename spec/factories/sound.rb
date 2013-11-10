require 'faker'

FactoryGirl.define do
  factory :sound do |f|
    f.name { Faker::Lorem.words(rand(4) + 1) }
    f.date Date.today
    f.snd File.new(Rails.root + 'spec/fixtures/audio/sample_audio.mp3')
    # auto-create SoundLangs
    f.sound_langs_attributes([
      { lang: "English", title: "Title", status: "new" },
      { lang: "French", title: "Title", status: "new" },
      { lang: "Spanish", title: "Title", status: "new" },
      { lang: "Creole", title: "Title", status: "new" },
    ])
  end
end
