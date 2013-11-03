class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def welcome(recipient)
  @account = recipient
  puts recipient.email
  mail(to: recipient.email,
       bcc: ["bcc@example.com", "Order Watcher <watcher@example.com>"])
  end
end
