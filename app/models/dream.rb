class Dream < ApplicationRecord
  validates :body, presence: true
  validates :title, presence: true

  belongs_to :user

  has_many :comments

  has_many :dream_categories, dependent: :nullify
  has_many :categories, through: :dream_categories
end
