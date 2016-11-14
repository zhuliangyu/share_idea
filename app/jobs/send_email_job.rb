class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    # likes=Like.where("created_at >= ?", Time.zone.now.beginning_of_day)
    #
    # likes.each do |like|
    #   user=like.idea.user
    #   IdeaLikeMailer.idea_like_email(user).deliver_later
    #
    # end


  end
end
