class Text < ActiveRecord::Base
  attr_accessible :name
  has_many :text_lang, dependent: :destroy
  belongs_to :item
  validates :author, presence: true

	def get_translations
			TextLang.where(:text_id => self.id)
	end

	def get_language(lang)
		TextLang.where(:text_id => self.id, :lang => lang).first
	end

	def construct_children
		for l in Item::LANGUAGES
			if not get_language(l)
				tl = TextLang.new()
				tl.lang = l
				tl.text_id = self.id
				tl.save
			end
		end
	end
end
