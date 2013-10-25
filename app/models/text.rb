# This is the text model
# It will not have an attachment but instead it's children will
class Text < ActiveRecord::Base
  attr_accessible :name, :author, :date, :text_langs_attributes, :notes, :tags_attributes, :tag_ids
  has_many :text_langs, dependent: :destroy
  belongs_to :item
  validates :author, presence: true
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :text_langs

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
