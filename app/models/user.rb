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
  validate :proper_parameters

  ROLES = [:Manager, :Tech, :Editor]
  LANGS = Item::LANGUAGES
  REQUIRED_FIELDS = [:first_name, :last_name, :email, :role, :lang, :password, :password_confirmation]

  def name
    "#{first_name} #{last_name}"
  end

  
  #protected

  def proper_parameters
    validate_parameter("role") and validate_parameter("lang")
  end

  def validate_parameter(type)
    if eval "self.#{type} and not #{type.pluralize.upcase}.include? self.#{type}.to_sym"
      add_error(type)
      return false
    else
      return true
    end 
  end

  def add_error(type)
    if type == "role"
      errors.add(:role, "must be either: Manager, Editor, or Tech")
    elsif type == "lang"
      errors.add(:lang, "must be either: English or French")
    end
  end
end
