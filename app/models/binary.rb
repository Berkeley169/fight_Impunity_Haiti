class Binary < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :binary_lang
end
