class PictureLang < ActiveRecord::Base
	attr_accessible :description, :lang, :title
	belongs_to :picture
	#validates :title, :lang, presence: true
end
