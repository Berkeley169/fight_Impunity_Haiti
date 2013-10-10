class TextLang < ActiveRecord::Base
  attr_accessible :description, :lang, :title, :txt
  has_attached_file :txt
  validates :lang, presence: true
  belongs_to :text
end
