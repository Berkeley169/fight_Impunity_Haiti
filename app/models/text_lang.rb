# This is the language specific version of the text model
# each language will have an attachment for the specific language
class TextLang < ActiveRecord::Base
  attr_accessible :description, :lang, :title, :txt, :plain_text, :published, :status
  has_attached_file :txt
  belongs_to :text
  validates :lang, presence: true
  validate :proper_file

  def proper_file
  	if self.txt_content_type == nil or self.txt_content_type == 'application/pdf'
  		return true
  	end
  	errors.add(:txt, 'must be a pdf')
  	return false
  end
end
