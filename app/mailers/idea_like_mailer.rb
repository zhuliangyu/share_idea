class IdeaLikeMailer < ApplicationMailer
  default from: "from@example.com"
  layout 'mailer'

  def idea_like_email(user)
    @user = user
    mail(to: @user.email, subject: 'You idea has been liked!!')
  end


end
