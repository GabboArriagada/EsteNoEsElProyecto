class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :content, length: { maximum: 50 }
end
