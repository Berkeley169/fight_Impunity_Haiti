# This is the overching model which owns all of the other types
# This should remain fairly empty but we will use this so that every
# item in the library has a unique ID.
class Item < ActiveRecord::Base
  attr_accessible :type
  LANGUAGES = [:English, :French, :Creole, :Spanish]

end
