# This is the language specific subset of a picutre
# it will not have an attachment
class PictureLang < ActiveRecord::Base
	attr_accessible :description, :lang, :title
	belongs_to :picture
	#validates :title, :lang, presence: true
end
