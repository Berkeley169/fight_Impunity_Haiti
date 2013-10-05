class Binary < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :binary_lang
  belongs_to :item

    def get_translations
  		#needs to be implemented
	end

	def get_language(lang)
		#needs to be implemented
	end
end
