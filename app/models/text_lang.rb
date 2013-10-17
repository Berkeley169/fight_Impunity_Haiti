# This is the language specific version of the text model
# each language will have an attachment for the specific language
class TextLang < ActiveRecord::Base
  attr_accessible :description, :lang, :title, :txt
  has_attached_file :txt
  belongs_to :text
end
