class User < ActiveRecord::Base
  attr_accessible :username, :hashed_password, :role, :lang
  
  validates_presence_of :username, :hashed_password, :role
  validates_uniqueness_of :username
  validates_length_of :username, :minimum => 6
  #validate :proper_role
  #validate :proper_lang

  ROLES = [:Manager, :Tech, :Editor]
  LANGS = [:English, :French]

  protected

  def proper_role
    if not ROLES.include? :role
      errors.add(:role, "must be either: Manager, Editor, or Tech")
    end 
  end

  def proper_lang
    if not LANGS.include? :lang
      errors.add(:lang, "must be either: English or French")
    end 
  end
end
