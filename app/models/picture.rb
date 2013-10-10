class Picture < ActiveRecord::Base
	attr_accessible :pic, :name, :picture_langs_attributes
	has_many :picture_langs
	accepts_nested_attributes_for :picture_langs
	has_attached_file :pic
	belongs_to :item
	accepts_nested_attributes_for :picture_langs
	validates :name, presence: true
    validates_attachment :pic, :presence => true,
                          :content_type => {:content_type => ['image/jpg', 'image/png', 'image/jpeg']}

  def get_translations
    self.picture_langs
	end

	def get_language(lang)
    if self.picture_langs.where(:lang => lang)
    	self.picture_langs.where(:lang => lang).first
    else
      return nil
    end
	end

end

