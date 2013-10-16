# This is the language specific version of the binary 
# Rerfer to this as other and not binary with the customer
class BinaryLang < ActiveRecord::Base
  attr_accessible :description, :lang, :title, :published
  belongs_to :binary
  has_attached_file :bin_lang
end
