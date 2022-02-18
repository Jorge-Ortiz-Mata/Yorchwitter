class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :image
  validates :body, presence: true, length: { minimum: 15 }
end
