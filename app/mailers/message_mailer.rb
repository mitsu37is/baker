class MessageMailer < ActionMailer::Base
  default from: 'baker@baker.com'
  default to: 'masa.ishi.right@gmail.com'

  def contact(message)
    @message = message
    mail(subject: 'お問い合わせを承りました')
  end
end