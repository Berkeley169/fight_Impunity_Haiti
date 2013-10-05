class Document < ActiveRecord::Base
  attr_accessible :creole, :date, :english, :french, :name, :spanish, :file
  # test class for paperclip
  has_attached_file :file
  validates :name, :presence => true

end
