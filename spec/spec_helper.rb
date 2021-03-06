require 'simplecov'
SimpleCov.start 'rails'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

module ValidModelConstructors
  def construct_valid_picture(name="TestName")
    file = File.new('spec/fixtures/images/beyonce.jpeg')
    p = Picture.new(:name => name, :pic => file)
    p.save
    return p
  end

  def construct_invalid_picture(name="TestName")
    file = File.new('spec/fixtures/documents/Lorem_ipsum.pdf')
    p = Picture.new(:name => name, :pic => file)
    p.save
    return p
  end

  def construct_valid_text()
    t = Text.new()
    t.save
    return t
  end
  def construct_valid_video()
    v = Video.new
    v.save
    return v
  end

  def construct_valid_sound()
    s = Sound.new
    s.save
    return s
  end

  def construct_valid_binary()
    b = Binary.new()
    b.save
    return b
  end

  def construct_valid_picture_lang(title="Title", lang="English")
    pl = PictureLang.new(:title => title, :lang => lang)
    pl.save
    return pl
  end
end

include Devise::TestHelpers

def setup_user(user = :manager)
  @request.env["devise.mapping"] = Devise.mappings[:manager]
  sign_in FactoryGirl.create(user)
end
