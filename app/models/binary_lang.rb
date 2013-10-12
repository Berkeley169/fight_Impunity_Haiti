class BinaryLang < ActiveRecord::Base
  attr_accessible :description, :lang, :title, :published
  belongs_to :binary
  has_attached_file :bin_lang
end
