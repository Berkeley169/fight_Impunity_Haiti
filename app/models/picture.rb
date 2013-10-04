class Picture < ActiveRecord::Base
  attr_accessible :pic, :name
  has_many :picture_lang
  has_attached_file :pic
  accepts_nested_attributes_for :picture_lang
end
