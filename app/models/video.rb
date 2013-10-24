# Video model
# Contains the information for the video
# Videos will probably not be translated
class Video < ActiveRecord::Base
  attr_accessible :name, :vid, :video_langs_attributes, :notes
  has_many :video_langs
  belongs_to :item
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :video_langs
  validates :name,:vid, presence: true
  
    def get_translations
        self.video_langs
    end

	def get_language(lang)
        if self.video_langs.where(:lang => lang)
            self.video_langs.where(:lang => lang).first
        else
            return nil
        end
	end


end
