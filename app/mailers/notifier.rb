class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def welcome(recipient)
  @account = recipient
  mail = mail(to: recipient.email,
       bcc: ["dummy@email.com", "Order Watcher <watcher@example.com>"])
  end

  def send_contact_request(sub, name, contact_email, email_body)
  	email_with_name = "#{name} <#{contact_email}>"
  	# need to send to the admins of the site
  	mail = mail(to: "a@b.c",
  				body: email_body,
  				content_type: "text/html",
  				subject: "Fight Impunity Haiti: #{sub}")
  end
end
