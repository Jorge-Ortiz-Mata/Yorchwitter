class User < ApplicationRecord
  has_one_attached :avatar
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :genre, presence: true
  validates :location, presence: true
  validates :date_birth, presence: true
  validates :account_id, presence: true
  belongs_to :account
end
