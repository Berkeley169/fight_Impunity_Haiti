class Video < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :video_lang
  belongs_to :item
  
end
