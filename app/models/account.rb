class Account < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true, length: { minimum: 6 }
    has_secure_password
    has_one :user, dependent: :destroy
    has_many :likes, dependent: :destroy
    
end
