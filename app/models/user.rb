class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :role, :lang, :name
  
  validates_presence_of :name, :password, :role, :password_confirmation, :email, :lang
  validates_uniqueness_of :name, :email
  validates_length_of :name, :minimum => 6
  #validate :proper_role
  #validate :proper_lang

  ROLES = [:Manager, :Tech, :Editor]
  LANGS = Item::LANGUAGES

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
