class Comment < ApplicationRecord
  validates :commenter, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
  belongs_to :user, dependent: :destroy
  belongs_to :post, dependent: :destroy
  has_one_attached :file, dependent: :destroy
end
