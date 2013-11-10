ActionMailer::Base.register_interceptor(SendGrid::MailInterceptor)

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '587',
  :domain => 'http://haiti-lutte-contre-limpunite.org/',
  :authentication => :plain,
  :user_name => 'fight_impunity_haiti',
  :password => 'f1ght1mpun1ty',
  :enable_starttls_auto => true
}