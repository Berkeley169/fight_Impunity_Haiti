# This is the sound model used to store audio files
# this should not have an attachment but each specific
# language should have one
class Sound < ActiveRecord::Base
  include Status
  include DocumentsHelper
  include PgSearch
  attr_accessible :snd, :name, :date, :sound_langs_attributes, :notes, :tags_attributes, :tag_ids,
                  :new, :in_progress, :pending, :published, :rejected
  has_many :sound_langs, dependent: :destroy
  accepts_nested_attributes_for :sound_langs
  has_attached_file :snd
  belongs_to :item
  validates :name, :presence => true
  validates_attachment :snd, :presence => true,
            :content_type => {:content_type => ['audio/mpeg3', 'audio/mpeg', 'audio/mp3']}
  after_validation :set_statuses
  has_and_belongs_to_many :tags
  multisearchable :against => [:name]

	def get_translations
			#needs to be implemented
      self.sound_langs
	end

	def get_language(lang)
		#needs to be implemented
    self.sound_langs.where(:lang => lang).first || nil
	end

end
