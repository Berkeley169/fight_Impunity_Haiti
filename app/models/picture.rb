# This is the class used to store images
# In general we will figure things out on this model first
# and then port to the other models
class Picture < ActiveRecord::Base
	attr_accessible :pic, :name, :picture_langs_attributes, :notes
	has_many :picture_langs
	accepts_nested_attributes_for :picture_langs
	has_attached_file :pic
	belongs_to :item
	accepts_nested_attributes_for :picture_langs
	validates :name, presence: true
    validates_attachment :pic, :presence => true,
                          :content_type => {:content_type => ['image/jpg', 'image/png', 'image/jpeg']}
    has_and_belongs_to_many :tags

  def get_translations
    self.picture_langs
	end

	def get_language(lang)
	    self.picture_langs.where(:lang => lang).first || nil
	end

end

