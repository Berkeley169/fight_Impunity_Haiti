class Document < ActiveRecord::Base
  attr_accessible :creole, :date, :english, :french, :name, :spanish
end
