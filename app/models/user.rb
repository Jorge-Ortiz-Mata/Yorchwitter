class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :genre, presence: true
  validates :location, presence: true
  validates :date_birth, presence: true
  validates :account_id, presence: true
  validates :avatar, presence: true
  has_one_attached :avatar, dependent: :destroy
  belongs_to :account
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :connections, dependent: :destroy
  has_many :followers, through: :connections
  has_many :likes, dependent: :destroy


  def self.search_users(result)
    @users_result_fn = where("first_name like ?", "%#{result}%")
    if @users_result_fn.length > 0
      return @users_result_fn
    else
      @users_result_ln = where("last_name like ?", "%#{result}%")
      if @users_result_ln.length > 0
        return @users_result_ln
      else
        return nil
      end
    end
  end
end
