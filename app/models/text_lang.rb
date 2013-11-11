# This is the language specific version of the text model
# each language will have an attachment for the specific language
class TextLang < ActiveRecord::Base
  attr_accessible :description, :lang, :title, :txt, :plain_text, :published, :status
  has_attached_file :txt, :styles => {:small => "150x150"}
  belongs_to :text
  validates :lang, presence: true
end
