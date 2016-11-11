class Idea < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  has_many :joins, dependent: :destroy
  has_many :users, through: :joins

  validates :title, presence: true
  validates :body, presence: true


end
