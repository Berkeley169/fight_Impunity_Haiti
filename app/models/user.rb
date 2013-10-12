class User < ActiveRecord::Base
  attr_accessible :username, :password, :hashed_password, :role, :lang

  validates_presence_of :username, :password, :hashed_password, :role
  validates_uniqueness_of :username
  validates_length_of :password, :minimum => 8
  validate proper_role
  validate proper_lang

  ROLES = [:manager, :tech, :editor]
  LANGS = [:english, :french]

  protected

  def proper_role
    if !ROLES.include? @role
      errors.add(:role, "Must be either: manager, editor, or tech")
    end 
  end

  def proper_lang
    if !LANGS.include? @lang
      errors.add(:lang, "Must be either: english or french")
    end 
  end
end
