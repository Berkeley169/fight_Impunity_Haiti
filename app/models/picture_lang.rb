# This is the language specific subset of a picutre
# it will not have an attachment
class PictureLang < ActiveRecord::Base
	include PgSearch
	attr_accessible :description, :lang, :title, :published, :status
	belongs_to :picture
	#validates :title, :lang, presence: true
end
