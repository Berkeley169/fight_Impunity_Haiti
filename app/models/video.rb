class Video < ActiveRecord::Base
  attr_accessible :name, :vid
  has_many :video_langs
  belongs_to :item
  accepts_nested_attributes_for :video_langs
  belongs_to :item
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
