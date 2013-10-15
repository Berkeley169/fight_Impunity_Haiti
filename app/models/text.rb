class Text < ActiveRecord::Base
  attr_accessible :name, :author, :date, :plain_text
  has_many :text_lang, dependent: :destroy
  belongs_to :item
  validates :author, presence: true
  has_and_belongs_to_many :tags

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
