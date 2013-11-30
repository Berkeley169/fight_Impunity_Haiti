# The language specific video information
# This one will probably be mostly empty
class VideoLang < ActiveRecord::Base
	include PgSearch
  	attr_accessible :description, :lang, :title, :published, :status
  	belongs_to :video
  	multisearchable :against => [:title, :description]
end
