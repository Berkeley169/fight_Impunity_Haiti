class Sound < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :sound_lang
end
