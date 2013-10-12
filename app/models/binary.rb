class Binary < ActiveRecord::Base
  attr_accessible :title, :binary_langs_attributes
  has_many :binary_langs
  belongs_to :item
  accepts_nested_attributes_for :binary_langs
  has_attached_file :bin
  validates :title, presence: true


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
