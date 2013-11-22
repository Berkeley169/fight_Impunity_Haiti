class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def welcome(recipient)
  @account = recipient
  mail = mail(to: recipient.email,
       bcc: ["dummy@email.com", "Order Watcher <watcher@example.com>"])
  end

  def contact_us(recipient, sub)
  	mail = mail(to: recipient.email,
  		subject: "FightImpunityHaiti: #{sub}")

end
