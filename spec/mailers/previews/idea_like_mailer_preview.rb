# Preview all emails at http://localhost:3000/rails/mailers/idea_like_mailer
class IdeaLikeMailerPreview < ActionMailer::Preview
  def idea_like_mail_preview
    IdeaLikeMailer.idea_like_email(User.first)
    # ExampleMailer.sample_email(User.first)
  end

end
