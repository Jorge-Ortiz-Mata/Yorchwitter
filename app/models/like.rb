class Like < ApplicationRecord
  belongs_to :account, dependent: :destroy
  belongs_to :post, dependent: :destroy
  def self.check_db_likes(account, post)
    where(account_id: account, post_id: post)
  end
end
