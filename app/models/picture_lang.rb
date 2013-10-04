class PictureLang < ActiveRecord::Base
  attr_accessible :description, :language, :title
  belongs_to :picture
end
