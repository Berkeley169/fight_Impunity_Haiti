ActionMailer::Base.register_interceptor(SendGrid::MailInterceptor)

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '25',
  :domain => 'herkou.com',
  :authentication => :plain,
  :user_name => 'fight_inpunity_haiti',
  :password => 'f1ght1mpun1ty'
}