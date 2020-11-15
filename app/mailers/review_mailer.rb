class ReviewMailer < ApplicationMailer
  def thank_user(user)
    mail(to: user.email, subject: 'Thank for review product')
  end
end
