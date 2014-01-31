# This is the class used to store images
# In general we will figure things out on this model first
# and then port to the other models
class Picture < ActiveRecord::Base
	include Status
	include DocumentsHelper
	include PgSearch
	attr_accessible :pic, :name, :date, :picture_langs_attributes, :notes, :tags_attributes, :tag_ids,
                  :new, :in_progress, :pending, :published, :rejected
	has_many :picture_langs, dependent: :destroy
	accepts_nested_attributes_for :picture_langs
	has_attached_file :pic
	belongs_to :item
  has_and_belongs_to_many :tags
	accepts_nested_attributes_for :picture_langs
    validates_attachment :pic, :presence => true,
                          :content_type => {:content_type => ['image/jpg', 'image/png', 'image/jpeg']}
    after_validation :set_statuses

    multisearchable :against => [:name]
    
   	def get_translations
    	self.picture_langs
	end

	def get_language(lang)
	    self.picture_langs.where(:lang => lang).first || nil
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

