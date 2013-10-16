# This is the binary class which is used to hold all of the other types of attachments we may want to upload
# When talking to the customer refer to this as "other" rather than "binary"
class Binary < ActiveRecord::Base
  attr_accessible :title, :binary_langs_attributes
  has_many :binary_langs
  belongs_to :item
  accepts_nested_attributes_for :binary_langs
  has_attached_file :bin
  validates :title, presence: true
  has_and_belongs_to_many :tags


    def get_translations
  		self.binary_langs
	end

	def get_language(lang)
    	if self.binary_langs.where(:lang => lang)
	    	self.binary_langs.where(:lang => lang).first
	    else
	      return nil
	    end
	end
end
