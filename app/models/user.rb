class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :genre, presence: true
  validates :location, presence: true
  validates :date_birth, presence: true
  validates :account_id, presence: true
  validates :avatar, presence: true
  has_one_attached :avatar
  belongs_to :account
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
