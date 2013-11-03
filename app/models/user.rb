class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :role, :lang, :first_name, :last_name
  
  validates_presence_of :first_name, :last_name, :password, :role, :password_confirmation, :email, :lang
  validates_uniqueness_of :email
  validate :proper_role
  validate :proper_lang

  ROLES = [:Manager, :Tech, :Editor]
  LANGS = Item::LANGUAGES
  REQUIRED_FIELDS = [:first_name, :last_name, :email, :role, :lang, :password, :password_confirmation]

  def name
    "#{first_name} #{last_name}"
  end

  
  #protected


  def proper_role
    if self.role and not ROLES.include? self.role.to_sym
      errors.add(:role, "must be either: Manager, Editor, or Tech")
      return false
    else
      return true
    end 
  end

  def proper_lang
    if self.lang and not LANGS.include? self.lang.to_sym
      errors.add(:lang, "must be either: English or French")
      return false
    else
      return true
    end 
  end
end
