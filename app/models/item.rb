class Item < ActiveRecord::Base
  attr_accessible :type
  LANGUAGES = [:English, :French, :Creole, :Spanish]

end
