# This is the text model
# It will not have an attachment but instead it's children will
class Text < ActiveRecord::Base
  include Status
  include DocumentsHelper
  include PgSearch
  attr_accessible :name, :date, :text_langs_attributes, :notes, 
                  :tags_attributes, :tag_ids, :subtype_fields, :subtype,
                  :new, :in_progress, :pending, :published, :rejected
  has_many :text_langs, dependent: :destroy
  belongs_to :item
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :text_langs
  #validates :subtype, :inclusion => { :in => ['web','journal','newspaper','book'] }
  serialize :subtype_fields, Hash
  after_validation :set_statuses
  cattr_accessor :web, :journal, :book, :newspaper

  multisearchable :against => [:name]

  Text.web       = [:website, :url]
  Text.journal   = [:journal, :volume]
  Text.newspaper = [:newspaper]
  Text.book      = [:title, :chapter]

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

  def self.published_documents
    where(:published => true)
  end

  def self.new_documents
    where(:new => true)
  end

  def self.pending_documents
    where(:pending => true)
  end

  def self.in_progress_documents
    where(:in_progress => true)
  end

  def self.rejected_documents
    where(:rejected => true)
  end
end
