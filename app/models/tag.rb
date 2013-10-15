class Tag < ActiveRecord::Base
  attr_accessible :creole, :english, :french, :spanish,
      :enlgish_description, :french_description, :spanish_description,
      :creole_description, :main_category
  has_and_belongs_to_many :pictures 
  has_and_belongs_to_many :videos
  has_and_belongs_to_many  :binaries
  has_and_belongs_to_many  :texts
  has_and_belongs_to_many  :sounds
end
