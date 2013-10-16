# This is the sound model used to store audio files
# this should not have an attachment but each specific
# language should have one
class Sound < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :sound_lang
  belongs_to :item
  has_and_belongs_to_many :tags

	def get_translations
			#needs to be implemented
	end

	def get_language(lang)
		#needs to be implemented
	end
end
