class Picture < ActiveRecord::Base
  attr_accessible :pic, :name
  has_many :picture_lang
  has_attached_file :pic

end
