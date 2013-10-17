# This is a test model to mess around with
# This will not make it into production so make sure to remove
# it before production
class Document < ActiveRecord::Base
  attr_accessible :creole, :date, :english, :french, :name, :spanish, :file
  # test class for paperclip
  has_attached_file :file
  validates :name, :presence => true

end
