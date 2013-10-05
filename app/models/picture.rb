class Picture < ActiveRecord::Base
	attr_accessible :pic, :name
	has_many :picture_lang
	has_attached_file :pic
	belongs_to :item
	accepts_nested_attributes_for :picture_lang

  	def get_translations
  		#needs to be implemented
	end

	def get_language(lang)
		#needs to be implemented
	end

end

