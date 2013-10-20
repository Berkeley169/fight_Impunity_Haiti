# This is the sound model used to store audio files
# this should not have an attachment but each specific
# language should have one
class Sound < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :snd, :name, :sound_langs_attributes
  has_many :sound_langs
  accepts_nested_attributes_for :sound_langs
  has_attached_file :snd
  belongs_to :item
  validates :name, :presence => true
  validates_attachment :snd, :presence => true,
            :content_type => {:content_type => ['audio/mpeg3', 'audio/mpeg']}
  has_and_belongs_to_many :tags

	def get_translations
			#needs to be implemented
      self.sound_langs
	end

	def get_language(lang)
		#needs to be implemented
    self.sound_langs.where(:lang => lang).first || nil
	end
end
