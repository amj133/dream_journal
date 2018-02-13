class User < ApplicationRecord
  has_secure_password
  
  validates :user_name, presence: true

  has_many :dreams
end
