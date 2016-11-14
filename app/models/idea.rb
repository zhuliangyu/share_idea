class Idea < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  has_many :joins, dependent: :destroy
  has_many :users, through: :joins

  validates :title, presence: true
  validates :body, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/no_picture.jpeg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end

# default_url: "/images/Idea-1.jpg"
# "assets/images/Idea-1.jpg"