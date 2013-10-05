class Text < ActiveRecord::Base
  attr_accessible :name
  has_many :text_lang
  belongs_to :item
end
