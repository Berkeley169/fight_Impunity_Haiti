class Text < ActiveRecord::Base
  attr_accessible :name
  has_many :text_lang
  belongs_to :item
  validates :author, presence: true

    def get_translations
  		TextLang.where(:text_id => self.id)
	end

	def get_language(lang)
		TextLang.where(:text_id => self.id, :lang => lang).first
	end
end
