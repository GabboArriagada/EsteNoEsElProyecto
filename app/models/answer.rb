class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :content, presence: true
  validates :content, length: { maximum: 100 }
end
