# This is the Tags class
# It has and belongs to all of the other file classes
# the tags will need to be translated into four langauges
# Tags will also own themselvea
class Tag < ActiveRecord::Base
  attr_accessible :creole, :english, :french, :spanish, :cat,
      :english_description, :french_description, :spanish_description,
      :creole_description, :parent_id
  has_and_belongs_to_many :pictures 
  has_and_belongs_to_many :videos
  has_and_belongs_to_many  :binaries
  has_and_belongs_to_many  :texts
  has_and_belongs_to_many  :sounds
  belongs_to :parent, :class_name => 'Tag'
  has_many :children, :class_name => 'Tag', :foreign_key => 'parent_id'
  validates :cat, presence: true, inclusion: { in: %w(main sub misc),
    message: "%{value} is not a valid type of tag" }
  validates :english, :spanish, :french, :creole, presence: true


  TYPES = ["main", "sub", "misc"]
end
