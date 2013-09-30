class Person < ActiveRecord::Base
  attr_accessible :editor, :first_name, :last_name, :manager, :public, :speaks_creole, :speaks_english, :speaks_french, :speaks_spanish
end
