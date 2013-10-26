# This is the language specific version of a language
# It should have an attachment for each language
class SoundLang < ActiveRecord::Base
  attr_accessible :description, :lang, :title, :published
  belongs_to :sound
end
