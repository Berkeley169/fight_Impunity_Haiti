class Page < ActiveRecord::Base
  attr_accessible :title, :english, :french, :spanish, :creole
  validates :english, :spanish, :french, :creole, :title, presence: true
end
