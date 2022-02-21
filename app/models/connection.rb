class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: 'User'

  def self.followers(followers)
    where(user_id: followers).count
  end

  def self.following(following)
    where(follower_id: following).count
  end
  
end
