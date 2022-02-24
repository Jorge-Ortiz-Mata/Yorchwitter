class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :body, presence: true, length: { minimum: 15 }
end
