class VideoLang < ActiveRecord::Base
  attr_accessible :description, :language, :title
  belongs_to :video
end
