class Picture < ActiveRecord::Base
	attr_accessible :pic, :name
	has_many :picture_lang
	has_attached_file :pic
	belongs_to :item
	accepts_nested_attributes_for :picture_lang
	validates :name, presence: true
    validates_attachment :pic, :presence => true,
                          :content_type => {:content_type => ['image/jpg', 'image/png', 'image/jpeg']}

  	def get_translations
  		#needs to be implemented
        PictureLang.where(:picture_id => self.id)
	end

	def get_language(lang)
		#needs to be implemented
        PictureLang.where(:picture_id => self.id, :lang => lang).first
	end

end

