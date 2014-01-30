class Notifier < ActionMailer::Base
  default from: "FightImpunityMailServer"

  def welcome(recipient)
  @account = recipient
  mail = mail(to: recipient.email,
       bcc: ["dummy@email.com", "Order Watcher <watcher@example.com>"])
  end

  def send_contact_request(sub, name, contact_email, email_body, p_num)
  	email_with_name = "#{name} <#{contact_email}>"
  	# need to send to the admins of the site
    body = "Name: #{name}<br />
            Email: #{contact_email}<br />
            Phone Number: #{p_num}<br />
            Reason: #{email_body}"
  	mail = mail(to: "shlci.webmestre@gmail.com",
  				body: body,
  				content_type: "text/html",
  				subject: "Fight Impunity Haiti: #{sub}")
  end
end
