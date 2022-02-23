class Like < ApplicationRecord
  belongs_to :account
  belongs_to :post
  def self.check_db_likes(account, post)
    where(account_id: account, post_id: post)
  end
end
