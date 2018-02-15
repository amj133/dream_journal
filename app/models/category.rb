class Category < ApplicationRecord
  validates :name, presence: true

  has_many :dream_categories, dependent: :nullify
  has_many :dreams, through: :dream_categories
end
