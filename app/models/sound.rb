# This is the sound model used to store audio files
# this should not have an attachment but each specific
# language should have one
class Sound < ActiveRecord::Base
<<<<<<< HEAD
  # attr_accessible :title, :body
  attr_accessible :sound, :name, :date, :sound_langs_attributes
  has_many :sound_langs
  accepts_nested_attributes_for :sound_langs
  has_attached_file :snd
  belongs_to :item
  validates :name, :presence => true
  validates_attachment :snd, :presence => true,
            :content_type => {:content_type => ['audio/mpeg3', 'audio/mpeg']}
=======
  attr_accessible :name, :snd
  has_many :sound_langs
  belongs_to :item
  has_and_belongs_to_many :tags
>>>>>>> 1f16ff1949748d67ac88db61ca28e4b96bedb664

	def get_translations
			#needs to be implemented
      self.sound_langs
	end

	def get_language(lang)
		#needs to be implemented
    if self.sound_langs.where(:lang => lang)
      self.sound_langs.where(:lang => lang).first
    else
      nil
    end
	end
end
