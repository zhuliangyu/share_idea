class User < ApplicationRecord
  has_many :ideas, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :ideas, through: :likes

  has_many :joins, dependent: :destroy
  has_many :ideas, through: :joins

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


end
