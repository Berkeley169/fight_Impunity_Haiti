# This is the binary class which is used to hold all of the other types of attachments we may want to upload
# When talking to the customer refer to this as "other" rather than "binary"
class Binary < ActiveRecord::Base
  include Status
  include DocumentsHelper
  include PgSearch
  attr_accessible :name, :date, :binary_langs_attributes, :notes, :tags_attributes, :tag_ids,
                  :new, :in_progress, :pending, :published, :rejected, :bin
  has_many :binary_langs, dependent: :destroy
  belongs_to :item
  accepts_nested_attributes_for :binary_langs
  has_attached_file :bin
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :tags
  after_validation :set_statuses
  multisearchable :against => [:name]

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
