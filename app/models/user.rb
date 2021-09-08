class User < ApplicationRecord
    has_secure_password
    has_many :meals
    has_one :profile
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :password, presence: true
end
