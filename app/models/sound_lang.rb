# This is the language specific version of a language
# It should have an attachment for each language
class SoundLang < ActiveRecord::Base
	include PgSearch
  	attr_accessible :description, :lang, :title, :published, :status
  	belongs_to :sound
  	multisearchable :against => [:title, :description]
end
