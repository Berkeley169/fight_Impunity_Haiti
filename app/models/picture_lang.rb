class PictureLang < ActiveRecord::Base
  attr_accessible :description, :lang, :title
  belongs_to :picture
end
