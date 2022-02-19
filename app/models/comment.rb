class Comment < ApplicationRecord
  validates :commenter, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
  belongs_to :user
  belongs_to :post
  has_one_attached :file
end
