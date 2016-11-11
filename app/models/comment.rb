class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates :body, presence: true
  validates :user,presence: true





end
