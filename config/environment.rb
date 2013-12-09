# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
FightImpunityHaiti::Application.initialize!
NEGATIVE_CAPTCHA_SECRET = 
if Rails.env.development? or Rails.env.test?
	('g' * 30)
else
	ENV['CAPTCHA_SECRET']
end

