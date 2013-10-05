class Text < ActiveRecord::Base
  attr_accessible :name
  has_many :text_lang
  belongs_to :item

    def get_translations
  		#needs to be implemented
	end

	def get_language(lang)
		#needs to be implemented
	end
end
