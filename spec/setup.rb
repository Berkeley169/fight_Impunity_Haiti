module Setup
  #include Devise::TestHelpers

  def self.setup_user(user = :manager)
    sign_in FactoryGirl.create(user)
  end

  def hello
  	puts 'hello'
  end

  public :setup_user

end