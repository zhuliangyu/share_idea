class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates :body, presence: true





end
