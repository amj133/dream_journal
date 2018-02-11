class Category < ApplicationRecord
  validates :name, presence: true

  has_many :dream_categories
  has_many :dreams, through: :dream_categories
end
