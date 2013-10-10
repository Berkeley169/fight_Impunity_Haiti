class TextLang < ActiveRecord::Base
  attr_accessible :description, :lang, :title, :txt
  has_attached_file :txt
  validates :title, :lang, presence: true
  validates_attachment :txt, :presence => true
end
